##Read Data
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

##Convert Global Active Power to numeric
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

##Convert data$Date to Date
library(lubridate)
data$Date<-dmy(data$Date)

##Subset for specific dates
dates<-subset(data, as.Date(data$Date)=='2007/02/01' | as.Date(data$Date)=='2007/02/02')

##Convert dates$Time to time
dates$Time<-hms(dates$Time)

##Line Graph
png(file="plot2.png", width = 480, height = 480)
plot(dates$Global_active_power,type="l", ylab="Global Active Power (kilowatts)", xlab="", xaxt="n")
axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
dev.off()