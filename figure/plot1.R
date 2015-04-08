## Read file using delimited format with semi colons as delimeters
df <-read.delim("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=F)
## Pull required date range
df <- subset(df, Date %in% c("1/2/2007", "2/2/2007"))
## Add date-time column
df <- within(df, { timestamp=as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))})

## Plot png with required formatting
png("plot1.png", width=480, height=480)
hist(df$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col=2, yaxp=c(0, 1200, 6))
dev.off()
