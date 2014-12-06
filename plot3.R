##read files into R
data<-read.table("household_power_consumption.txt", header=TRUE,sep=";",na.string="?")

##subset the data get the two days' data
mydata<-subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")

## transform the date time data to Date type
Date_Time<-paste(mydata$Date, mydata$Time)
Date.Time<-strptime(Date_Time, format="%d/%m/%Y %H:%M:%S")

##open the graph devices

png(file="plot3.png",width=480, height=480)

##draw the graphs
plot(Date.Time,mydata$Sub_metering_1,type="l", ylab="Energy sub metering",xlab="", col="black",ylim=range(1:40))
lines(Date.Time,mydata$Sub_metering_2,type="l",col="red")
lines(Date.Time,mydata$Sub_metering_3,type="l",col="blue")
legend("topright", col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1))

##close the graph device
dev.off()