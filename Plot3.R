
##Call Library Table
library("data.table")

##Loading data in Table 
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

##Converting Date and Time
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$datetime <- as.POSIXct(strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")) 

##Filtering data from the dates 2007-02-01 and 2007-02-02
Cleandata <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

##Drawing Plot 
attach(Cleandata) #Attaching data source
plot(Sub_metering_1 ~ datetime, type = "l",ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Saving file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
detach(Cleandata)

