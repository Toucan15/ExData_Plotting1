##sqldf package reads a database to memory and returns a dataframe within the 
##filters provided, in this case just the dates needed for this series of graphs.
require(sqldf)
data2days <- read.csv.sql("household_power_consumption.txt", 
                          header = TRUE, sep = ";", 
                          sql = "select * from file where 
                          (Date == '1/2/2007' OR Date == '2/2/2007')" )
png(file = "plot1.png")
##PLOT 1
hist(data2days$Global_active_power, 
     breaks = 16,
     main = "Global Active Power",
     font.main = 2,
     xlab = "Global Active Power (kilowatts)",
     col = "red",
     ylim = c(0, 1200),
     pin = 5, 5,
     cex.axis = 0.8,
     cex.main = 0.8,
     cex.lab = 0.8)
dev.off()
