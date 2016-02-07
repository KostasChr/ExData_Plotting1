
#Read file
data <- read.table(file="household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
#Parse Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
#Select data only for relevant dates
wdata <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02") )
#Parse Time
wdata$Time <- strptime(wdata$Time,"%H:%M:%S")
#Add date information to Time column
wdata$Time$year<- as.POSIXlt(wdata$Date)$year
wdata$Time$mon<- as.POSIXlt(wdata$Date)$mon
wdata$Time$mday<- as.POSIXlt(wdata$Date)$mday
#Enable png file output
png("plot3.png",
    width     = 480,
    height    = 480,
    units     = "px")
#Build Canvas

with(wdata,plot(Time, Sub_metering_1, type="n",xlab= " " , ylab="Energy sub metering"))

#Build Lines 1,2 and 3
with(wdata,lines(Time, Sub_metering_1, col = "black"))
with(wdata,lines(Time, Sub_metering_2, col = "red"))
with(wdata,lines(Time, Sub_metering_3, col = "blue"))
#Add Legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
#Exit device
dev.off()
