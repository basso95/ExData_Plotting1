require(lubridate)
#Download and unzip the file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "power_consumption.zip")
unzip("power_consumption.zip")

#Read the file only from the beginning of1/2/2007 (66636 line), from the end 
#of 2/2/2007. Then I assign correct column names (obtained in names).
names <- read.table("household_power_consumption.txt",sep=';',na.strings='?', 
                    nrow=1, as.is=T)
set <-read.table("household_power_consumption.txt",header=TRUE,sep=';', 
                 na.strings='?', skip=66636, nrow=2880, col.names=names)

#Set correct classes for Date and Time values (in the third command i combine date
#and time)
set$Date <- dmy(set$Date)
set$Time <- hms(set$Time)
set$date.time <- set$Date + set$Time

#Open png device
png("plot2.png", width = 480, height = 480)

#Plot the second graph
#NOTE: dates on xlab are in Italian!!
with(set, plot(date.time, Global_active_power, ylab="Global Active Power (kilowatts)",
               xlab="", type="l"))

#Turn off device
dev.off()