electrcitydata <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, 
                             header = TRUE, sep =";"  )

FullTimeDate <- strptime(paste(electrcitydata$Date, electrcitydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
electrcitydata <- cbind(electrcitydata, FullTimeDate)

electrcitydata$Date <- as.Date(electrcitydata$Date, format="%d/%m/%Y")
electrcitydata$Time <- format(electrcitydata$Time, format="%H:%M:%S")
electrcitydata$Global_active_power <- as.numeric(electrcitydata$Global_active_power)
electrcitydata$Global_reactive_power <- as.numeric(electrcitydata$Global_reactive_power)
electrcitydata$Voltage <- as.numeric(electrcitydata$Voltage)
electrcitydata$Global_intensity <- as.numeric(electrcitydata$Global_intensity)
electrcitydata$Sub_metering_1 <- as.numeric(electrcitydata$Sub_metering_1)
electrcitydata$Sub_metering_2 <- as.numeric(electrcitydata$Sub_metering_2)
electrcitydata$Sub_metering_3 <- as.numeric(electrcitydata$Sub_metering_3)

subdata <- subset(electrcitydata, Date == "2007-02-01" | Date =="2007-02-02")

png("plot2.png", width=480, height=480)
with(subdata, plot(FullTimeDate, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
dev.off()
