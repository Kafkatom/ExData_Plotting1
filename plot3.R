data<-read.table("household_power_consumption.txt",sep= ";", na="?",header= TRUE)
D<-as.Date(data$Date,"%d/%m/%Y")
feb12<-subset(data,(D>"2007-01-31"&D<"2007-02-03"))

Time<-feb12$Time
GAP<-feb12$Global_active_power
Date<-feb12$Date
Day<-paste(Date,Time)
Day <-strptime(Day,  format="%d/%m/%Y %T")
Sub1<-feb12$Sub_metering_1
Sub2<-feb12$Sub_metering_2
Sub3<-feb12$Sub_metering_3


png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")

plot(Day, Sub1,ylim=c(0,max(Sub1)),ylab="",xlab="" ,col="black",type="l")
lines(Day,Sub1,col="black")
axis(2, ylim=c(0,max(Sub1)),col="black")

par(new=T)
plot(Day, Sub2,ylab="",xlab="", ylim=c(0,max(Sub1)), 
type="l", main="")
axis(2, ylim=c(0,max(Sub1)))
lines(Day, Sub2, col="red")

par(new=T)
plot(Day, Sub3,ylab="Energy sub metering",xlab="", ylim=c(0,max(Sub1)),  
type="l", main="")
axis(2, ylim=c(0,max(Sub1)))
lines(Day, Sub3,col="blue")

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
		text.font=10,lty=1, col=c("black","red","blue"))

dev.off()
