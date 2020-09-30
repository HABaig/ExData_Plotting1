#Creating Explanatory Plots 

#set a placeholder for data file
file <- "household_power_consumption.zip"
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

## Download and unzip the dataset
if (!file.exists(file)){
  download.file(fileURL, file, method="curl")
}  

if (!file.exists("household_power_consumption.txt")) { 
  unzip(file) 
}


#Load the dataset
#The dataset has 2,075,259 rows and 9 columns. 
library(data.table)
dat <- fread(input = "household_power_consumption.txt", na.strings="?")
data<-  dat
#We will only be using data from the dates 2007-02-01 and 2007-02-02, so
#we can subset the data from selected dates
data = subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

#Check the type of data in each coloumn
str(data)

#create a POSIXlt object with date time 
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#create a placeholder for the plot with 480 x 480 resolution
png("plot2.png", width=480, height=480)

## Plot 2
plot(x= datetime, type="l",
     y= data$Global_active_power, 
     xlab= "",
     ylab="Global Active Power (kilowatts)")

dev.off()

