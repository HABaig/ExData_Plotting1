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
data <- fread(input = "household_power_consumption.txt", na.strings="?")

#We will only be using data from the dates 2007-02-01 and 2007-02-02, so
#we can subset the data from selected dates

#Check the type od data in each coloumn
str(data)
#Date column is given as character, first we need to convert it to 'Date' type.
data$Date <- as.Date(data$Date, "%d/%m/%Y")
str(data)

data<-filter(data, Date >= "2007-02-01" , Date <= "2007-02-02")
  
#create a placeholder for the plot with 480 x 480 resolution
png("plot1.png", width=480, height=480)

## Plot 1
hist(data[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
