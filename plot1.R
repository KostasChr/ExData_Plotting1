
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
png("plot1.png",
        width     = 480,
        height    = 480,
        units     = "px")
#Build Histogram
hist(wdata$Global_active_power, col = "red", xlab = "Global Active Power (killowats)", main = "Global Active Power")
#Exit device
dev.off()