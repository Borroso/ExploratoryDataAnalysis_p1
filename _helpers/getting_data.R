download.and.extract.zip <- function(url) {

    # prepare data folder
    if (!file.exists("_row_data")) {
      dir.create("_row_data")
    }

    # set zip destiny file
    filename <- "_row_data/dataset.zip"

    if (!file.exists(filename)){
        download.file(url, filename, method="curl")
        unzip(filename, exdir = "_row_data")
    }

}

# downloads the row data
download.and.extract.zip("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")

# saves the desired info into rowdata variable
rowdata <- read.table('./_row_data/household_power_consumption.txt', header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?", dec=".")

# transform Date 
rowdata$Date <- as.Date(rowdata$Date, format = "%d/%m/%Y")

# subsets data from "01/02/2007" until "02/02/2007"
data <- subset(rowdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02") )
rm(rowdata)

# cleans data and add Data_time column
data[3:9] <- sapply(data[3:9],as.numeric)
data$Date_time <- as.POSIXct(paste(as.Date(data$Date), data$Time))




