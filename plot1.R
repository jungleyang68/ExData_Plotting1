#Project Assignment 1 for Exploratory Data Analysis
#plot1.R
##Reading and Processing Data
setwd("./Desktop/Course_Exploratory Data/")
data<-read.table("household_power_consumption.txt",sep=";",header=T,stringsAsFactor=F)
t<-strptime(paste(data[,1],data[,2]),format="%d/%m/%Y %H:%M:%S")
data<-cbind(t,data[,3:9])
names(data)[1]<-"Time"
d1<-subset(data,data[,1]>=as.POSIXct("2007-02-01") & data[,1]<as.POSIXct("2007-02-03"))
d1[,2:7]<-data.frame(sapply(d1[,2:7],as.numeric))


##Plotting
png("plot1.png")
par(ps=12)
with(d1,hist(Global_active_power,col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)"))
dev.off()
