library(data.table)
setwd("C:\\Users\\Brian\\Documents\\MOOCS\\Coursera\\Exploratory Data Analysis")
PowerData<-fread("household_power_consumption.txt",sep=";", stringsAsFactors=F,colClasses=list(Date=1,Time=2,Double=3:9))
PowerData<-PowerData[PowerData$Date == "1/2/2007" |PowerData$Date == "2/2/2007"]
TimedDates<-as.POSIXct(paste(PowerData$Date, PowerData$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
par(mfrow=c(1,1))
plot(TimedDates,as.numeric(PowerData$Global_active_power),type="l",ylab="Global Active Power (kilowatts)", xlab="")
