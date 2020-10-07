## Gráfico 2

library("data.table")

data <- data.table::fread("household_power_consumption.txt")

data[, Global_active_power, .SDcols = c("Global_active_power")]

data[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

data <- data[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)

plot(x = data[, dateTime], y = data[, Global_active_power], type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()