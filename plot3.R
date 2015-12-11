 plot3  <- function() {
	# Read in data
	allData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
	# Convert dates
	allData$Date <- as.Date(allData$Date, format = "%d/%m/%Y")
	# Extract data from the dates 2007-02-01 and 2007-02-02
	partData <- subset(allData, Date >= "2007-02-01" & Date <= "2007-02-02")
	# Parse dates
	partData$timetemp <- paste(partData$Date, partData$Time)
	partData$DateTime <- strptime(partData$timetemp, format= "%Y-%m-%d %H:%M:%S")
	# Plot Sub metering vs Time
	png("plot3.png", 480, 480, units = "px")
	plot(partData$DateTime, partData$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
	lines(partData$DateTime, partData$Sub_metering_2, col = I("red"))
	lines(partData$DateTime, partData$Sub_metering_3, col = I("blue"))
	legend("topright", lty = c(1, 1, 1), col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_2"))
	dev.off()
 }
 