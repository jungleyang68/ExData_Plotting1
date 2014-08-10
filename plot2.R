#Project Assignment 1 for Exploratory Data Analysis
#plot2.R
##Reading and Processing Data
setwd("./Desktop/Course_Exploratory Data/")
data<-read.table("household_power_consumption.txt",sep=";",header=T,stringsAsFactor=F)
t<-strptime(paste(data[,1],data[,2]),format="%d/%m/%Y %H:%M:%S")
data<-cbind(t,data[,3:9])
names(data)[1]<-"Time"
d1<-subset(data,data[,1]>=as.POSIXct("2007-02-01") & data[,1]<as.POSIXct("2007-02-03"))
d1[,2:7]<-data.frame(sapply(d1[,2:7],as.numeric))


##Plotting
png("plot2.png")
Sys.setlocale("LC_TIME", "C") #Set locale time to english
par(ps=12)
with(d1,plot(Time,Global_active_power,
    xlab="",
    ylab="Global Active Power (kilowatts)",type="n"))
with(d1,lines(Time, Global_active_power))
dev.off()
