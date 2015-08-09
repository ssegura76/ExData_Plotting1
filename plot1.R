##Read Data
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

##Convert Global Active Power to numeric
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

##Convert data$Date to Date
library(lubridate)
data$Date<-dmy(data$Date)

##Subset for specific dates
dates<-subset(data, as.Date(data$Date)=='2007/02/01' | as.Date(data$Date)=='2007/02/02')

##Histogram
png(file="plot1.png", width = 480, height = 480)
hist(dates$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()