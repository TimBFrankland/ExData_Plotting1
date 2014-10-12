#Read the first 100 rows to get the data types of each column
hpc <- read.table("C:\\Users\\Tim\\Downloads\\household_power_consumption.txt", 
                  sep=";", colClasses=c("character","character",rep("numeric",7)),header=TRUE
                  ,fill=TRUE, na.strings=c("","?","NA"))

#Change date column to a date
hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")

#Subset the dataset
hpcsub<-subset(hpc,hpc$Date=="2007-02-01"|hpc$Date=="2007-02-02")


#Plot bar chart 
#make dimensions 480x480
#add title to chart and label to x-axis
#make tick marks and labels every 200
png(filename = "Plot1.png",width = 480, height = 480)
hist(hpcsub$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
axis(side=2, at=seq(0,1200, 200), labels=seq(0,1200,200))     
dev.off()
    
