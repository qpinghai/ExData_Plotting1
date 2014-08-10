data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, "%d/%m/%Y")

startdate <- as.Date("2007-02-01")
enddate <- as.Date("2007-02-02")

newsubset <- data[which(data$Date >= startdate & data$Date <= enddate),  ]

newsubset$Date <- strptime(paste(newsubset$Date,newsubset$Time), "%Y-%m-%d %H:%M:%S")

plot(newsubset$Date, newsubset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png", width=480, height=480, units="px")

dev.off() 