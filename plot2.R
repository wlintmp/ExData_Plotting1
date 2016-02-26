library(tidyr)
library(dplyr)

l<-read.table("household_power_consumption.txt",sep=";", header = T)
tmp<-strptime(paste(l$Date,l$Time),"%d/%m/%Y %H:%M:%S")
l<-cbind(DT=tmp,l)
y1<-strptime("2007-01-31 23:59:59","%Y-%m-%d %H:%M:%S")
y2<-strptime("2007-02-03 00:00:00","%Y-%m-%d %H:%M:%S")
fl<-filter(l,y1<DT,DT<y2)
fl$Date<-NULL
fl$Time<-NULL
fl$Global_active_power<-as.numeric(levels(fl$Global_active_power)[fl$Global_active_power])
fl$Global_reactive_power<-as.numeric(levels(fl$Global_reactive_power)[fl$Global_reactive_power])
fl$Voltage<-as.numeric(levels(fl$Voltage)[fl$Voltage])
fl$Global_intensity<-as.numeric(levels(fl$Global_intensity)[fl$Global_intensity])
fl$Sub_metering_1<-as.numeric(levels(fl$Sub_metering_1)[fl$Sub_metering_1])
fl$Sub_metering_2<-as.numeric(levels(fl$Sub_metering_2)[fl$Sub_metering_2])

png(filename = "plot2.png",width = 480, height = 480)
plot(fl$DT,fl$Global_active_power,ylab = "Global Active Power (kilowatts)",type = 'l',xlab='')
dev.off()