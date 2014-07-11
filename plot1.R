data <- read.csv(file='household_power_consumption.txt', header=TRUE, sep=';', colClasses = c("character", "character", rep("numeric",7)), na.strings='?')

data <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

png(filename='plot1.png', width=480, height=480)
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", freq=TRUE)
dev.off()