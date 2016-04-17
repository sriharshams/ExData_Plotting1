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
png(filename="plot4.png", width=480, height=480, units="px")

par(mfrow=c(2,2))

#1st 
plot(household_power_consumption$Global_active_power, type="l",xaxt="n",xlab="", ylab="Global Active Power")
axis(1, at=c(1, as.integer(nrow(household_power_consumption)/2), nrow(household_power_consumption)), labels=c("Thu", "Fri", "Sat"))

#2nd
plot(household_power_consumption$Voltage, type="l",xaxt="n",xlab="datetime", ylab="Voltage")
axis(1, at=c(1, as.integer(nrow(household_power_consumption)/2), nrow(household_power_consumption)), labels=c("Thu", "Fri", "Sat"))


#3rd
with(household_power_consumption, {
  plot(Sub_metering_1,type="l", xaxt="n", xlab="", ylab="Energy sub metering")
  lines(x=Sub_metering_2, col="red")
  lines(x=Sub_metering_3, col="blue")
})
axis(1, at=c(1, as.integer(nrow(household_power_consumption)/2), nrow(household_power_consumption)), labels=c("Thu", "Fri", "Sat"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lwd = 0,box.col = "transparent", bg="transparent")

#4th
plot(household_power_consumption$Global_active_power, type="l",xaxt="n",xlab="datetime", ylab="Global_reactive_power")
axis(1, at=c(1, as.integer(nrow(household_power_consumption)/2), nrow(household_power_consumption)), labels=c("Thu", "Fri", "Sat"))

dev.off()