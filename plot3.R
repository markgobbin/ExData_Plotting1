#read data with ? as NA
file<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",stringsAsFactors=FALSE)
#process dates and times
file$Timestamp<-strptime(paste(file$Date,file$Time,sep=" "),format="%d/%m/%Y %T")
file$Date<-as.Date(paste(file$Date,file$Time),format="%d/%m/%Y")
#select data we will be using
data<-subset(file,Date>="2007-02-01"&Date<="2007-02-02")

#Export
png("plot3.png",width=480,height=480)
#set colors
colors=c("black","red","blue")
#plot data
with(data, plot(Timestamp,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
lines(data$Timestamp,data$Sub_metering_1,col=colors[1])
lines(data$Timestamp,data$Sub_metering_2,col=colors[2])
lines(data$Timestamp,data$Sub_metering_3,col=colors[3])
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),title="",lty=1,col=colors)
dev.off()
