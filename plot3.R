# changes work directory to current folder
setwd(getSrcDirectory(function(x) {x}))

# adds data. Reads the zip file and extracts the data and save it into data variable
source("./_helpers/getting_data.R")

# creates png and save it at root
png("plot3.png", width=480, height=480, bg=NA)
with(data, {
  plot(Sub_metering_1~Date_time, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Date_time,col='Red')
  lines(Sub_metering_3~Date_time,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
