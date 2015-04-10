data<-read.table("household_power_consumption.txt",sep= ";", na="?",header= TRUE)
D<-as.Date(data$Date,"%d/%m/%Y")
feb12<-subset(data,(D>"2007-01-31"&D<"2007-02-03"))

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")
with(feb12,hist(Global_active_power, 
			main="Global active power",
			col="red", 
			xlab="Global active power (kilowatts)"))

dev.off()
