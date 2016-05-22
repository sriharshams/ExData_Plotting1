## Author: Sriharsha M S
## Project : Assignment: Course Project 1

getwd()
# set the folder where you have downloaded data from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# extracted the file household_power_consumption.txt
setwd("C:/learning/coursera/coursera-data_science-data/exploratory_data_analysis/week1/data")
# set class types for columns
colClasses = c("character", "character", rep("numeric",7) )
# read the file having ';' as delimeter into a data frame called household_power_consumption
household_power_consumption <- read.delim("household_power_consumption.txt", header = TRUE, colClasses=colClasses, sep = ";", na.strings = "?")

# The dataset has 2,075,259 rows and 9 columns
dim(household_power_consumption)

names(household_power_consumption)

head(household_power_consumption)

#convert to Date type, then filter
household_power_consumption$Date = as.Date(household_power_consumption$Date, format="%d/%m/%Y")
household_power_consumption = household_power_consumption[household_power_consumption$Date >= as.Date("2007-02-01") & household_power_consumption$Date<=as.Date("2007-02-02"),]

#to save plot graph change direcroty
setwd("C:/learning/coursera/data_science/exploratory_data_analysis/week1/assignment/ExData_Plotting1")

#plot and save graph
png(filename="plot1.png", width=480, height=480, units="px")
hist(household_power_consumption$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
