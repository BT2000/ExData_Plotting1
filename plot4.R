#Load Data
library(data.table)
setwd("C:\\Users\\Brian\\Documents\\MOOCS\\Coursera\\Exploratory Data Analysis")
PowerData<-fread("household_power_consumption.txt",sep=";", 
   stringsAsFactors=F,colClasses=list(Date=1,Time=2,Double=3:9))
PowerData<-PowerData[PowerData$Date == "1/2/2007" |PowerData$Date == "2/2/2007"]
TimedDates<-as.POSIXct(paste(PowerData$Date, PowerData$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
#Create Frame
par(mfrow=c(2,2))

#Plot 1 Hist
plot(TimedDates,as.numeric(PowerData$Global_active_power),type="l",
     ylab="Global Active Power", xlab="datetime")
#Plot 2 
plot(TimedDates,as.numeric(PowerData$Voltage),type="l",ylab="Voltage", xlab="datetime")
#Plot 3
plot(TimedDates,ylab="Energy sub metering",xlab="",PowerData$Sub_metering_1,type="l",col="black")
lines(TimedDates,PowerData$Sub_metering_2,type="l", col= "red")
lines(TimedDates,PowerData$Sub_metering_3,type="l",col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
#Plot 4
plot(TimedDates,as.numeric(PowerData$Global_reactive_power),type="l", ylab= "Global_reactive_power",xlab="datetime")
