##Read Data
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

##Convert Global Active Power to numeric
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Voltage <- as.numeric(as.character(data$Voltage))

##Convert data$Date to Date
library(lubridate)
data$Date<-dmy(data$Date)

##Subset for specific dates
dates<-subset(data, as.Date(data$Date)=='2007/02/01' | as.Date(data$Date)=='2007/02/02')

##Convert dates$Time to time
dates$Time<-hms(dates$Time)

##Multiple Graph
png(file="plot4.png",width = 480, height = 480)

par(mfrow=c(2,2))

with(dates, {
    plot(Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="", xaxt="n")
    axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))    

    plot(Voltage, type="l", ylab="Voltage", xlab="datetime", xaxt="n")
    axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))    
    
    plot(Sub_metering_1,type = "n", xlab = "", ylab = "Energy sub Metering", xaxt="n")
    lines(Sub_metering_1,col="black")
    lines(Sub_metering_2,col="red")
    lines(Sub_metering_3,col="blue")
    axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
    legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub _metering_1","Sub _metering_2","Sub _metering_3"),cex=0.8)    

    plot(Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime", xaxt="n")
    axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))    
    
    
})


dev.off()