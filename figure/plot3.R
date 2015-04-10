## Read file using delimited format with semi colons as delimeters
df <-read.delim("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=F)
## Pull required date range
df <- subset(df, Date %in% c("1/2/2007", "2/2/2007"))
## Add date-time column
df <- within(df, { timestamp=as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))})

## Plot png with required formatting
png("plot3.png", width=480, height=480)
with(df, plot(timestamp, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(df, points(timestamp, Sub_metering_2, type="l", col="red"))
with(df, points(timestamp, Sub_metering_3, type="l", col="blue"))
legend("topright", lty=c(1,1), col = c("black","blue", "red"), legend = c("Sub_monitoring_1", "Sub_monitoring_2", "Sub_monitoring_3"))
dev.off()
