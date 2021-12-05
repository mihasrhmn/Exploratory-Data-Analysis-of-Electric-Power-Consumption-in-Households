# loading required libraries
library(data.table)

# downloading the dataset & unziping it into the current folder
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "dataFiles.zip", method = "curl")
unzip(zipfile = "dataFiles.zip")

# read the dataset into R & subsetting it to 01/02/2007 from 02/02/2007
data <- data.table::fread(input = "household_power_consumption.txt", sep = ";", na.strings = "?")
data <- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007"))

# creating the histogram
# setting the output png file dimensions:
png(filename = "plot1.png", width=480, height= 480)
with(data, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power"))
dev.off()
