 plot4  <- function() {
	# Read in data
	allData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
	# Convert dates
	allData$Date <- as.Date(allData$Date, format = "%d/%m/%Y")
	# Extract data from the dates 2007-02-01 and 2007-02-02
	partData <- subset(allData, Date >= "2007-02-01" & Date <= "2007-02-02")
	# Parse dates
	partData$timetemp <- paste(partData$Date, partData$Time)
	partData$DateTime <- strptime(partData$timetemp, format= "%Y-%m-%d %H:%M:%S")
	png("plot4.png", 480, 480, units = "px")
	par(mfrow = c(2, 2))
	# Plot Global Active Power vs Time
	plot(partData$DateTime, partData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
	# Plot Voltage vs Time
	plot(partData$DateTime, partData$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
	# Plot Sub metering vs Time
	plot(partData$DateTime, partData$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
	lines(partData$DateTime, partData$Sub_metering_2, col = I("red"))
	lines(partData$DateTime, partData$Sub_metering_3, col = I("blue"))
	legend("topright", lty = c(1, 1, 1), col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_2"))
	# Plot Global_reactive_power vs Time
	plot(partData$DateTime, partData$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
	dev.off()
 }
 