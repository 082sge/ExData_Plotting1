filename <- "household_power_consumption.txt"
if (!file.exists("household_power_consumption.txt"))
  power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subsetpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

datetime <- strptime(paste(subsetpower$Date, subsetpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subsetpower$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()