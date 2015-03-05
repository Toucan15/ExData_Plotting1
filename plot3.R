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

png(file = "plot3.png")
##PLOT 3
with(data2days, {
  plot(datetime, Sub_metering_1, type = "l", xlab = "",
       ylab = "Energy submetering",
       cex.axis = 0.8,
       cex.lab = 0.8)
  lines(datetime, Sub_metering_2, type = "l", col = "red")
  lines(datetime, Sub_metering_3, type = "l", col = "blue")
  legend("topright", cex = 0.8, lty = 1, col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()