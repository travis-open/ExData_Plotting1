data = read.table("household_power_consumption.txt", header = FALSE, sep = ";", skip = 66637, nrows=2880, na.strings = "?",col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
data$Time<-strptime(data$Time, format = "%H:%M:%S")
data$Date<-as.Date(data$Date, "%d/%m/%Y")
##load data from .txt file, convert Time and Date to relevant formats
png(file="plot1.png")
##create file to make plot in
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
##make the histogram, clean labels, color red
dev.off()
##the .png file can now be used.