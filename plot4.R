data = read.table("household_power_consumption.txt", header = FALSE, sep = ";", skip = 66637, nrows=2880, na.strings = "?",col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
data$Time<-strptime(data$Time, format = "%H:%M:%S")
data$Date<-as.Date(data$Date, "%d/%m/%Y")
##load data from .txt file, convert Time and Date to relevant formats
png(file="plot4.png")
##create file to make plot in
par(mfrow=c(2,2))
##set 2x2 orientation
plot(data$Global_active_power, type = "l", xaxt = "n", ylab = "Global Active Power (kilowatts)",xlab=" ")
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))
##make plot 1, top left
plot(data$Voltage, type = "l", xaxt = "n", ylab = "Voltage", xlab = "datetime")
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))
##make plot 2, top right
plot(data$Sub_metering_1, type = "l", xaxt = "n", ylab = "Energy sub metering",xlab=" ")
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))
lines(data$Sub_metering_2,col="red")
lines(data$Sub_metering_3,col="blue")
legend("topright",bty="n",lwd=1,col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
##make plot 3, bottom left
plot(data$Global_reactive_power, type = "l", xaxt = "n", ylab = "Global_reactive_power", xlab = "datetime")
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))
##make plot 4, bottom right
dev.off()
##the .png file can now be used.