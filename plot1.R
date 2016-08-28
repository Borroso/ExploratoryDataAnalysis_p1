# changes work directory to current folder
setwd(getSrcDirectory(function(x) {x}))

# adds data. Reads the zip file and extracts the data and save it into data variable
source("./_helpers/getting_data.R")

# creates png and save it at root
png("plot1.png", width=480, height=480, bg=NA)
hist(data$Global_active_power, col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
