##read files into R
data<-read.table("household_power_consumption.txt", header=TRUE,sep=";",na.string="?")

##subset the data get the two days' data
mydata<-subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")

## transform the date time data to Date type
Date_Time<-paste(mydata$Date, mydata$Time)
Date.Time<-strptime(Date_Time, format="%d/%m/%Y %H:%M:%S")


##open the graph devices
png(file="plot2.png",width=480, height=480)

##plot graph
plot(Date.Time, mydata$Global_active_power,type="l", ylab="Global Active Power (kilowatts)",xlab="") 

##close the graph device
dev.off()
