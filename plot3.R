#Project Assignment 1 for Exploratory Data Analysis
#plot3.R
##Reading and Processing Data
setwd("./Desktop/Course_Exploratory Data/")
data<-read.table("household_power_consumption.txt",sep=";",header=T,stringsAsFactor=F)
t<-strptime(paste(data[,1],data[,2]),format="%d/%m/%Y %H:%M:%S")
data<-cbind(t,data[,3:9])
names(data)[1]<-"Time"
d1<-subset(data,data[,1]>=as.POSIXct("2007-02-01") & data[,1]<as.POSIXct("2007-02-03"))
d1[,2:7]<-data.frame(sapply(d1[,2:7],as.numeric))


##Plotting
png("plot3.png")
par(ps=12)
Sys.setlocale("LC_TIME", "C") #Set locale time to english
with(d1,plot(Time,Sub_metering_1,
     xlab="",
     ylab="Energy sub metering",type="n"))
with(d1,lines(Time, Sub_metering_1))
with(d1,lines(Time, Sub_metering_2,col="red"))
with(d1,lines(Time, Sub_metering_3,col="blue"))
legend("topright",lwd=1,col=c("black","red","blue"),
       legend=names(d1)[6:8])

#dev.copy(png,"plot3.png")
dev.off()
