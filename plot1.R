data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")

startdate <- as.Date("2007-02-01")
enddate <- as.Date("2007-02-02")

newsubset <- data[which(data$Date >= startdate & data$Date <= enddate),  ]

hist(as.numeric(newsubset$Global_active_power), breaks = 11, col = "red", 
     xlab="Global Active Power (kilowatts)", main = "Global Active Power")

dev.copy(png, file = "plot1.png", width=480, height=480, units="px")

dev.off() 
