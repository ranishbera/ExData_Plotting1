##To Plot the Histogram for Global Active Power

##The program assumes that the data is already downloaded in the working directory

Total_Data=read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")##Full data read in the memory
Data = Total_Data[Total_Data$Date %in% c("1/2/2007", "2/2/2007"),]##Subsetting
global_active_power = Data$Global_active_power##Defining  the variable to plot
global_active_power=as.double(global_active_power)##Converted the variable from char to numeric
datetime <- strptime(paste(Data$Date, Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")##Converted date into the format dd/mm/yyyy
png("plot2.png",width=480, height=480)
plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
