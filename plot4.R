data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")

startdate <- as.Date("2007-02-01")
enddate <- as.Date("2007-02-02")

newsubset <- data[which(data$Date >= startdate & data$Date <= enddate),  ]
newsubset$Date <- strptime(paste(newsubset$Date,newsubset$Time), "%Y-%m-%d %H:%M:%S")

png(file = "plot4.png", width=480, height=480, units="px")

par(mfrow = c(2, 2))

hist(as.numeric(newsubset$Global_active_power), breaks = 11, col = "red", 
     xlab="Global Active Power (kilowatts)", main = "")

plot(newsubset$Date, newsubset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(newsubset$Date, newsubset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(newsubset$Date, newsubset$Sub_metering_2, col = "red")
lines(newsubset$Date, newsubset$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(newsubset$Date, newsubset$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


dev.off() 