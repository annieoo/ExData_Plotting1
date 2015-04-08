# reading the main file
dfile <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# getting subset data for required 2 days
subfile <- dfile[which(dfile$Date == '1/2/2007' | dfile$Date == '2/2/2007'), ]

# plotting the graph to save it to png file

png(filename="plot1.png", width=480, height=480)
hist(subfile$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

dev.off()
