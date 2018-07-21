# Reads in data from file then subsets data for specified dates
householdpower <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(householdpower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(householdpower,householdpower$Date=="1/2/2007" | householdpower$Date =="2/2/2007")

#plot function - simple base graphics - histogram
hist(as.numeric(as.character(subpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

# put annotation for the graph title
title(main="Global Active Power")

## Copy my plot to a PNG file
dev.copy(png, file = "plot1.png",width=480, height=480)  
dev.off()  ## Don't forget to close the PNG device!

