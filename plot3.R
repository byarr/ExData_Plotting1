data <- read.csv(file='household_power_consumption.txt', header=TRUE, sep=';', colClasses = c("character", "character", rep("numeric",7)), na.strings='?')

data <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

data$ts = strptime(paste(data$Date, data$Time, sep=' '), format="%d/%m/%Y %H:%M:%s")
row.names(data) <- data$ts

png(filename='plot3.png', width=480, height=480)
plot(data$Sub_metering_1, col='black', type='l', axes=FALSE, xlab="", ylab="Energy sub metering")
lines(data$Sub_metering_2, col='red')
lines(data$Sub_metering_3, col='blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1, cex=.75, border = "black")
box()
#axis.Date(x=data$ts, side=1, format="%a") #Only generates one tick at 'Thu'
axis(side=1, at=c(1,nrow(data)/2,nrow(data)), labels=dateLabels)
axis(side=2)
dev.off()