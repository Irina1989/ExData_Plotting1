# week 1 course project

setwd("C:/Users/Irina Ebert/Desktop/Data_Science/exploratory_data_analysis")

## loading the data

data <- read.table("household_power_consumption.txt", header = TRUE, 
			sep = ';', na.strings = "?", nrows = 2075259)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_subset <- data[data$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

## Plot 3
png("plot3.png", width = 480, height = 480, units = "px")
plot(data_subset$Sub_metering_1, type = 'l', 
ylab = "Energy sub metering",
xlab = "", xaxt = "n")
lines(data_subset$Sub_metering_2, col = 'red')
lines(data_subset$Sub_metering_3, col = 'blue')
axis(side = 1, at = c(0, length(data_subset$Sub_metering_1)/2, 
length(data_subset$Sub_metering_1)), labels = c("Thu","Fri", "Sat"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
lty = c(1,1,1), col= c("black", "red", "blue"))
dev.off()
