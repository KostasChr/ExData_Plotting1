
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
png("plot4.png",
    width     = 480,
    height    = 480,
    units     = "px")
#Build Panel with 4 items
par(mfrow=c(2,2))
#Build 1st plot with lines
with(wdata,plot(Time, Global_active_power, type="n",xlab= " " , ylab="Global Active Power"))
with(wdata,lines(Time, Global_active_power))
#Build 2nd plot with lines
with(wdata,plot(Time, Voltage, type="n",xlab= "datetime" , ylab="Voltage"))
with(wdata,lines(Time, Voltage))
#Build 3rd plot with lines
with(wdata,plot(Time, Sub_metering_1, type="n",xlab= " " , ylab="Energy sub metering"))
with(wdata,lines(Time, Sub_metering_1, col = "black"))
with(wdata,lines(Time, Sub_metering_2, col = "red"))
with(wdata,lines(Time, Sub_metering_3, col = "blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n", lty=c(1,1,1),col=c("black","red","blue"))
#Build 4th plot
with(wdata,plot(Time, Global_reactive_power, type="n",xlab= "datetime" , ylab="Global_reactive_power"))
with(wdata,lines(Time, Global_reactive_power))
#Exit device
dev.off()
