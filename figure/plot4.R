## Read file using delimited format with semi colons as delimeters
df <-read.delim("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=F)
## Pull required date range
df <- subset(df, Date %in% c("1/2/2007", "2/2/2007"))
## Add date-time column
df <- within(df, { timestamp=as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))})

## Plot png with required formatting
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))   # 2x2 plot
with(df, {plot(timestamp, Global_active_power, type="l", ylab="Global Active Power", xlab="")
          plot(timestamp, Voltage, type="l", ylab="Voltage", xlab="datetime")
          plot(timestamp, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
          points(timestamp, Sub_metering_2, type="l", col="red")
          points(timestamp, Sub_metering_3, type="l", col="blue")
          legend("topright", cex=0.9, lty=c(1,1), col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
          plot(timestamp, Global_reactive_power, type="l", xlab="datetime")
          })
dev.off()
