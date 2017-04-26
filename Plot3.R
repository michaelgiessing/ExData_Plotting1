library(lubridate)


setwd('C:/Users/michael.giessing/Documents/GitHub/ExData_Plotting1')

#Download and unzip
#download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip','FUCI_HAR_Dataset.zip')

unzip('exdata_data_household_power_consumption.zip')

power <- read.csv2('household_power_consumption.txt', stringsAsFactors = FALSE)


power1 <-power[power$Date == '1/2/2007' | power$Date == '2/2/2007', ]
 

power1$Date <- dmy(power1$Date)
power1$Time <- hms(power1$Time)
power1$datetime <- power1$Time + power1$Date
power1$Global_active_power <- as.numeric(power1$Global_active_power)
GAP <- as.numeric(power1$Global_active_power)
power1$Date + power1$time

png(file = "plot3.png")

par( mfrow=c(1,1))


#plot 3
plot(power1$datetime, power1$Sub_metering_1, type = "l", xlab ="",ylab="Energy sub metering")
lines(power1$datetime, power1$Sub_metering_2, type = "l", col= "red")
lines(power1$datetime, power1$Sub_metering_3, type = "l", col= "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=1, col = c("black","red","blue"))

dev.off()
