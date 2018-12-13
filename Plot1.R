

#Call Library Table
library("data.table")

#Load data in Table 
dT <- data.table::fread(input = "household_power_consumption.txt",na.strings="?")

#Converting scientific values data from table 
dT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

#Converting Date and Time
dT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

#Filtering data from the dates 2007-02-01 and 2007-02-02
CleandT <- dT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

#Draw Plot 
hist(CleandT[, Global_active_power], main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#Save file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()

