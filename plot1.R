library(data.table)
setwd("C:\\Users\\Brian\\Documents\\MOOCS\\Coursera\\Exploratory Data Analysis")
PowerData<-fread("household_power_consumption.txt",sep=";", stringsAsFactors=F,colClasses=list(Date=1,Time=2,Double=3:9))
PowerData<-PowerData[PowerData$Date == "1/2/2007" |PowerData$Date == "2/2/2007"]
par(mfrow=c(1,1))
hist(as.numeric(PowerData$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
