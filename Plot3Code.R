#Read the first 100 rows to get the data types of each column
hpc <- read.table("C:\\Users\\Tim\\Downloads\\household_power_consumption.txt", 
                  sep=";", colClasses=c("character","character",rep("numeric",7)),header=TRUE
                  ,fill=TRUE, na.strings=c("","?","NA"))

#Change date column to a date
hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")

#Subset the dataset
hpcsub<-subset(hpc,hpc$Date=="2007-02-01"|hpc$Date=="2007-02-02")

hpcsub$datetime<-as.POSIXct(paste(hpcsub$Date, hpcsub$Time), format="%Y-%m-%d %H:%M:%S")

#Plot bar chart 
#make dimensions 480x480
#add title to chart and label to x-axis
#make tick marks and labels every 200
png(filename = "Plot3.png",width = 480, height = 480)
plot(hpcsub$datetime,hpcsub$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(hpcsub$datetime,hpcsub$Sub_metering_2, col="red")
lines(hpcsub$datetime,hpcsub$Sub_metering_3, col="blue")
legend("topright", pch = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2",
"Sub_metering_3"))
dev.off()

