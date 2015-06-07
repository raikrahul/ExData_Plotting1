poww <- read.csv("~/ExData_Plotting1/household_power_consumption.txt", sep=";")

poww$Date <- as.Date(poww$Date, format="%d/%m/%Y")
powerRelevant<-poww[(poww$Date=="2007-02-01") | (poww$Date=="2007-02-02"),]
powerRelevant$Global_active_power <- as.numeric(as.character(powerRelevant$Global_active_power))
powerRelevant$Global_reactive_power <- as.numeric(as.character(powerRelevant$Global_reactive_power))
powerRelevant$Voltage <- as.numeric(as.character(powerRelevant$Voltage))
powerRelevant <- transform(powerRelevant, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
powerRelevant$Sub_metering_1 <- as.numeric(as.character(powerRelevant$Sub_metering_1))
powerRelevant$Sub_metering_2 <- as.numeric(as.character(powerRelevant$Sub_metering_2))
powerRelevant$Sub_metering_3 <- as.numeric(as.character(powerRelevant$Sub_metering_3))




plot(powerRelevant$timestamp,powerRelevant$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(powerRelevant$timestamp,powerRelevant$Sub_metering_2,col="red")
lines(powerRelevant$timestamp,powerRelevant$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()