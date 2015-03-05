require(sqldf)
data2days <- read.csv.sql("household_power_consumption.txt", 
                          header = TRUE, sep = ";", 
                          sql = "select * from file where 
                          (Date == '1/2/2007' OR Date == '2/2/2007')" )

##this section adds a variable datetime calculated from the existing
##Date and Time columns. 
##lubridate converts it from character to POSIXct
library(lubridate)

data2days$datetime <- paste(data2days$Date, data2days$Time, sep = " ")
data2days$datetime <- dmy_hms(data2days$datetime)

png(file = "plot2.png")
##PLOT 2
plot(data2days$datetime, data2days$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     cex.axis = 0.8,
     cex.lab = 0.8)
dev.off()