#Project Assignment 1 for Exploratory Data Analysis
#plot4.R
##Reading and Processing Data

setwd("./Desktop/Course_Exploratory Data/")
data<-read.table("household_power_consumption.txt",sep=";",header=T,stringsAsFactor=F)
t<-strptime(paste(data[,1],data[,2]),format="%d/%m/%Y %H:%M:%S")
data<-cbind(t,data[,3:9])
names(data)[1]<-"Time"
d1<-subset(data,data[,1]>=as.POSIXct("2007-02-01") & data[,1]<as.POSIXct("2007-02-03"))
d1[,2:7]<-data.frame(sapply(d1[,2:7],as.numeric))


##Plotting
png("plot4.png")
par(mfcol=c(2,2),ps=12)
#plot1
with(d1,plot(Time,Global_active_power,
             xlab="",
             ylab="Global Active Power",type="n"))
with(d1,lines(Time, Global_active_power))

#plot2
with(d1,plot(Time,Sub_metering_1,
             xlab="",
             ylab="Energy sub metering",type="n"))
with(d1,lines(Time, Sub_metering_1))
with(d1,lines(Time, Sub_metering_2,col="red"))
with(d1,lines(Time, Sub_metering_3,col="blue"))
legend("topright",bty="n",lwd=1,text.width=80000,col=c("black","red","blue"),
       legend=names(d1)[6:8])


#plot3
with(d1,plot(Time,Voltage,
             xlab="datatime",
             ylab="Voltage",type="n"))
with(d1,lines(Time, Voltage))

#plot4
with(d1,plot(Time,Global_reactive_power,
             xlab="datatime",
             ylab="Global_reactive_power",type="n"))
with(d1,lines(Time, Global_reactive_power))

dev.off()

