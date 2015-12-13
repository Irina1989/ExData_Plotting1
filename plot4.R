# week 1 course project

setwd("C:/Users/Irina Ebert/Desktop/Data_Science/exploratory_data_analysis")

## loading the data

data <- read.table("household_power_consumption.txt", header = TRUE, 
			sep = ';', na.strings = "?", nrows = 2075259)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_subset <- data[data$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

## Plot 4
png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
plot(data_subset$Global_active_power, type = 'l', 
ylab = "Global Active Power",
xlab = "", xaxt = "n", cex.lab = 0.75)
axis(side = 1, at = c(0, length(data_subset$Global_active_power)/2, 
length(data_subset$Global_active_power)), labels = c("Thu","Fri", "Sat"))

plot(data_subset$Voltage, type = 'l', 
ylab = "Voltage",
xlab = "datetime", xaxt = "n", cex.lab = 0.75)
axis(side = 1, at = c(0, length(data_subset$Global_active_power)/2, 
length(data_subset$Global_active_power)), labels = c("Thu","Fri", "Sat"))


plot(data_subset$Sub_metering_1, type = 'l', 
ylab = "Energy sub metering",
xlab = "", xaxt = "n", cex.lab = 0.75)
lines(data_subset$Sub_metering_2, col = 'red')
lines(data_subset$Sub_metering_3, col = 'blue')
axis(side = 1, at = c(0, length(data_subset$Sub_metering_1)/2, 
length(data_subset$Sub_metering_1)), labels = c("Thu","Fri", "Sat"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
lty = c(1,1,1), col= c("black", "red", "blue"), bty = "n", cex = 0.8)

plot(data_subset$Global_reactive_power, type = 'l',
ylab = "Global_reactive_power",
xlab = "datetime", xaxt = "n", cex.lab = 0.75)
axis(side = 1, at = c(0, length(data_subset$Global_reactive_power)/2, 
length(data_subset$Global_reactive_power)), labels = c("Thu","Fri", "Sat"))
dev.off()
