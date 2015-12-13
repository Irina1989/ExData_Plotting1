# week 1 course project

setwd("C:/Users/Irina Ebert/Desktop/Data_Science/exploratory_data_analysis")

## loading the data

data <- read.table("household_power_consumption.txt", header = TRUE, 
			sep = ';', na.strings = "?", nrows = 2075259)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_subset <- data[data$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

## Plot 2
png("plot2.png", width = 480, height = 480, units = "px")
plot(data_subset$Global_active_power, type = 'l', 
ylab = "Global Active Power (kilowatts)",
xlab = "", xaxt = "n")
axis(side = 1, at = c(0, length(data_subset$Global_active_power)/2, 
length(data_subset$Global_active_power)), labels = c("Thu","Fri", "Sat"))
dev.off()
