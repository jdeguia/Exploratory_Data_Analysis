# Reads in data from file then subsets data for specified dates
houlseholdpower <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(houlseholdpower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(houlseholdpower,houlseholdpower$Date=="1/2/2007" | houlseholdpower$Date =="2/2/2007")

# Making a POSIXlt date capable of being filtered and graphed by time of day and format dates of 2007-02-01 and 2007-02-02
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
subpower[1:1440,"Time"] <- format(subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- format(subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# plot function - base graphics
plot(subpower$Time,as.numeric(as.character(subpower$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# put annotation for the graph title
title(main="Global Active Power Vs Time")

## Copy my plot to a PNG file
dev.copy(png, file = "plot2.png",width=480, height=480)  
dev.off()  ## Don't forget to close the PNG device!
