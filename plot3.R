# reading the main file
dfile <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# getting subset data for required 2 days
dfile$Date <- as.character(dfile$Date)
dfile$Time <- as.character(dfile$Time)
subfile <- dfile[which(dfile$Date == '1/2/2007' | dfile$Date == '2/2/2007'), ]

subfile$dt <- (paste(subfile$Date, subfile$Time))
subfile$dt <- strptime(subfile$dt, format="%d/%m/%Y %H:%M:%S")

# plotting the graph to save it to png file

png(filename="plot3.png", width=480, height=480)
plot(subfile$dt, subfile$Sub_metering_1, type='l', xlab="", ylab="Global Active Power (kilowatts)")

plot(subfile$dt, subfile$Sub_metering_1, type='l', col="black", xlab="", ylab="Energy sub metering")
lines(subfile$dt, subfile$Sub_metering_2, col="red")
lines(subfile$dt, subfile$Sub_metering_3, col="blue")

legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty="solid")

dev.off()