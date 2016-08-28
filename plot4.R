# changes work directory to current folder
setwd(getSrcDirectory(function(x) {x}))

# adds data. Reads the zip file and extracts the data and save it into data variable
source("./_helpers/getting_data.R")

# creates png and save it at root
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2), bg=NA) 
plot(data$Date_time, data$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(data$Date_time, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
with(data, {
  plot(Sub_metering_1~Date_time, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Date_time,col='Red')
  lines(Sub_metering_3~Date_time,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty = "n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(data$Date_time, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
