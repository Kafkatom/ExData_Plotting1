data<-read.table("household_power_consumption.txt",sep= ";", na="?",header= TRUE)
D<-as.Date(data$Date,"%d/%m/%Y")
feb12<-subset(data,(D>"2007-01-31"&D<"2007-02-03"))

Time<-feb12$Time
GAP<-feb12$Global_active_power
Date<-feb12$Date
Day<-paste(Date,Time)
Day <-strptime(Day,  format="%d/%m/%Y %T")

png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")


plot(Day,GAP, type="l", ylab="Global Active Power (kilowatts)")


dev.off()
