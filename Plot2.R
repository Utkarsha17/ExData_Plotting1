

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
plot(Global_active_power ~ datetime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

##Saving file
dev.copy(png, file = "plot2.png", height = 400, width = 400)
dev.off()
detach(Cleandata)
