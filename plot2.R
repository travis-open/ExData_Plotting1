data = read.table("household_power_consumption.txt", header = FALSE, sep = ";", skip = 66637, nrows=2880, na.strings = "?",col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
data$Time<-strptime(data$Time, format = "%H:%M:%S")
data$Date<-as.Date(data$Date, "%d/%m/%Y")
##load data from .txt file, convert Time and Date to relevant formats
png(file="plot2.png")
##create file to make plot in
plot(data$Global_active_power, type = "l", xaxt = "n", ylab = "Global Active Power (kilowatts)",xlab=" ")
##plot data as a line, omits x-axis so that one can be created
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))
##create tick marks and desired weekday labeling
dev.off()
##the .png file can now be used.