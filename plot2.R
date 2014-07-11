data <- read.csv(file='household_power_consumption.txt', header=TRUE, sep=';', colClasses = c("character", "character", rep("numeric",7)), na.strings='?')

data <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

data$ts = strptime(paste(data$Date, data$Time, sep=' '), format="%d/%m/%Y %H:%M:%s")
row.names(data) <- data$ts


dateLabels = format.Date(x=as.Date(c("2007-02-01", "2007-02-02", "2007-02-03")), format="%a")


png(filename='plot2.png', width=480, height=480)
plot(data$Global_active_power, col='black', type='l', axes=FALSE, xlab="", ylab="Global Active Power (kilowatts)")
box()
#axis.Date(x=data$ts, side=1, format="%a") #Only generates one tick at 'Thu'
axis(side=1, at=c(1,nrow(data)/2,nrow(data)), labels=dateLabels)
axis(side=2)
dev.off()