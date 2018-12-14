##Calling Library Table
library("data.table") 

##Loading data in Table 
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

##Converting Date and Time
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

##Filtering data from the dates 2007-02-01 and 2007-02-02
Cleandata <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

##Drawing Plot 
attach(Cleandata) #Attaching data source
hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

##Saving file
dev.copy(png, file = "plot1.png", height = 500, width = 500)
dev.off()
detach(Cleandata) # Detaching data source
