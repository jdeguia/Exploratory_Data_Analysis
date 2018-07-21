# Data Science Coursera
Exploratory Data Analysis July 16 - Aug 19, 2018

## Exploratory Data Analysis Project 1

This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. In particular, we will be using the “Individual household electric power consumption Data Set” which I have made available on the course web site:

Dataset:
[Electric power consumption](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip) [20Mb]
</br>Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.

##Loading the data:

When loading the dataset into R, the following should be considered:

* Check your computer has enough memory.

* Read and subset the dates only to 2007-02-01 and 2007-02-02.

* You may find it useful to convert the Date and Time variables to
Date/Time classes in R using the `strptime()` and `as.Date()`
functions.

* Note that in this dataset missing values are coded as `?`.

## Making Plots

The goal is to examine how household energy usage
varies over a 2-day period in February, 2007. The task is to
reconstruct the plots using the base plotting system.

The plot should have the following:

* Saved in a PNG file with a width of 480
pixels and a height of 480 pixels.

* Named each of the plot files as `plot1.png`, `plot2.png`, `plot3.png`,
`plot4.png`.

* Include the R code files (`plot1.R`, `plot2.R`, `plot3.R`,`plot4.R`) that
constructs the corresponding plot, i.e. code in `plot1.R` constructs
the `plot1.png` plot. Your code file **should include code for reading
the data** so that the plot can be fully reproduced. You should also
include the code that creates the PNG file.

* Add the PNG file and R code file to your git repository

When you are finished with the assignment, push your git repository to
GitHub so that the GitHub version of your repository is up to
date. There should be four PNG files and four R code files.

## Plot 1
```R
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
```
![Plot 1](https://github.com/jdeguia/Exploratory_Data_Analysis/blob/master/plot1.png)   

## Plot 2
```R
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
```
![Plot 2](https://github.com/jdeguia/Exploratory_Data_Analysis/blob/master/plot2.png)

## Plot 3
```R
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
plot(subpower$Time,subpower$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subpower,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subpower,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subpower,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# put annotation for the graph title
title(main="Energy sub-metering")

## Copy my plot to a PNG file
dev.copy(png, file = "plot3.png",width=480, height=480)  
dev.off()  ## Don't forget to close the PNG device!
```
![Plot 3](https://github.com/jdeguia/Exploratory_Data_Analysis/blob/master/plot3.png) 

## Plot 4
```R
# Reads in data from file then subsets data for specified dates
houlseholdpower <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(houlseholdpower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(houlseholdpower,houlseholdpower$Date=="1/2/2007" | houlseholdpower$Date =="2/2/2007")

# Making a POSIXlt date capable of being filtered and graphed by time of day and format dates of 2007-02-01 and 2007-02-02
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
subpower[1:1440,"Time"] <- format(subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- format(subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# initiating a composite plot with many graphs
par(mfrow=c(2,2))

# plot function - multiple base plots
with(subpower,{
  plot(subpower$Time,as.numeric(as.character(subpower$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(subpower$Time,as.numeric(as.character(subpower$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subpower$Time,subpower$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subpower,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subpower,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(subpower,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subpower$Time,as.numeric(as.character(subpower$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

## Copy my plot to a PNG file
dev.copy(png, file = "plot4.png",width=480, height=480)  
dev.off()  ## Don't forget to close the PNG device!
```
![Plot 4](https://github.com/jdeguia/Exploratory_Data_Analysis/blob/master/plot4.png) 
