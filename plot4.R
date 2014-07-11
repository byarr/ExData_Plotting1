data <- read.csv(file='household_power_consumption.txt', header=TRUE, sep=';', colClasses = c("character", "character", rep("numeric",7)), na.strings='?')

data <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

data$ts = strptime(paste(data$Date, data$Time, sep=' '), format="%d/%m/%Y %H:%M:%s")
row.names(data) <- data$ts

dateLabels = format.Date(x=as.Date(c("2007-02-01", "2007-02-02", "2007-02-03")), format="%a")


png(filename='plot4.png', width=480, height=480)

par(mfrow = c(2,2))
#plot2
plot(data$Global_active_power, col='black', type='l', axes=FALSE, xlab="", ylab="Global Active Power (kilowatts)")
box()
#axis.Date(dates, side=1, format="%a" ) # this code only generates a single date label of 'Thu'
axis(side=1, at=c(1,nrow(data)/2,nrow(data)), labels=dateLabels)
axis(side=2)

# plot voltage
plot(data$Voltage, col='black', type='l', axes=FALSE, xlab="", ylab="Voltage")
box()
axis.Date(x=data$ts, side=1, format="%a") # this code only generates a single date label of 'Thu'
axis(side=1, at=c(1,nrow(data)/2,nrow(data)), labels=dateLabels)
axis(side=2)


#Plot4
plot(data$Sub_metering_1, col='black', type='l', axes=FALSE, xlab="", ylab="Energy sub metering")
lines(data$Sub_metering_2, col='red')
lines(data$Sub_metering_3, col='blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1, cex=.75)
box()
#axis.Date(x=data$ts, side=1, format="%a")  # this code only generates a single date label of 'Thu'
axis(side=1, at=c(1,nrow(data)/2,nrow(data)), labels=dateLabels)
axis(side=2)

#global reactive power
plot(data$Global_reactive_power, col='black', type='l', axes=FALSE, xlab="", ylab="Global_reactive_power")
box()
#axis.Date(x=data$ts, side=1, format="%a")
axis(side=1, at=c(1,nrow(data)/2,nrow(data)), labels=dateLabels)
axis(side=2)

dev.off()