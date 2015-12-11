 plot1  <- function() {
	# Read in data
	allData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
	# Convert dates
	allData$Date <- as.Date(allData$Date, format = "%d/%m/%Y")
	# Extract data from the dates 2007-02-01 and 2007-02-02
	partData <- subset(allData, Date >= "2007-02-01" & Date <= "2007-02-02")
	# Plot histogram of Global Active Power
	png("plot1.png", 480, 480, units = "px")
	hist(partData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = I("red"))
	dev.off()
 }
 