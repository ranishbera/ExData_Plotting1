##To Plot the Histogram for Global Active Power

##The program assumes that the data is already downloaded in the working directory

Total_Data=read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")##Full data read in the memory
Data = Total_Data[Total_Data$Date %in% c("1/2/2007", "2/2/2007"),]##Subsetting
global_active_power = Data$Global_active_power##Defining  the variable to plot
global_active_power=as.double(global_active_power)##Converted the variable from char to numeric
datetime <- strptime(paste(Data$Date, Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")##Converted date into the format dd/mm/yyyy
global_reactive_power = Data$Global_reactive_power
global_reactive_power = as.double(global_reactive_power)
voltage = Data$Voltage
voltage = as.double(voltage)
submetering1 = Data$Sub_metering_1
submetering1 = as.double(submetering1)
submetering2 = Data$Sub_metering_2
submetering2 = as.double(submetering2)
submetering3 = Data$Sub_metering_3
submetering3 = as.double(submetering3)
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(datetime,global_active_power, type = "l", xlab = "Date", ylab = "Global Acyive Power", cex = 0.2)
plot(datetime, voltage, type = "l", xlab = "Date", ylab = "Voltage")
plot(datetime, submetering1, type = "l", ylab = "Energy Sub-Metering", xlab = " ")
lines(datetime, submetering2, type = "l", col = "red")
lines(datetime, submetering3, type = "l", col = "blue")
legend("topright", c("Submetering 1", "Submetering 2", "Submetering 3"),lwd = 2.5, col = c("black", "red", "blue"), bty = "o")
plot(datetime, global_reactive_power, type = "l", xlab = "Date", ylab = "Global Reactive Power")
dev.off()
