##Read Data
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

##Convert Global Active Power to numeric
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

##Convert data$Date to Date
library(lubridate)
data$Date<-dmy(data$Date)

##Subset for specific dates
dates<-subset(data, as.Date(data$Date)=='2007/02/01' | as.Date(data$Date)=='2007/02/02')

##Convert dates$Time to time
dates$Time<-hms(dates$Time)

##Multiple Line Graph
png(file="plot3.png", width = 480, height = 480)
plot(dates$Sub_metering_1,type = "n", xlab = "", ylab = "Energy sub Metering", xaxt="n")
lines(dates$Sub_metering_1,col="black")
lines(dates$Sub_metering_2,col="red")
lines(dates$Sub_metering_3,col="blue")
axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub _metering_1","Sub _metering_2","Sub _metering_3"),cex=0.8)
dev.off()