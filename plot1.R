##read files into R
data<-read.table("household_power_consumption.txt", header=TRUE,sep=";",na.string="?")

##subset the data get the two days' data
mydata<-subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")

## transform the date time data to Date type
Date_Time<-paste(mydata$Date, mydata$Time)
Date.Time<-strptime(Date_Time, format="%d/%m/%Y %H:%M:%S")

##open graph devices
png(file="plot1.png",width=480, height=480)

##draw graph
hist(mydata$Global_active_power, breaks=11, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")

## close graph devices
dev.off()
