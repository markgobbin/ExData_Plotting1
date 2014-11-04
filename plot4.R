#read data with ? as NA
file<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",stringsAsFactors=FALSE)
#process dates and times
file$Timestamp<-strptime(paste(file$Date,file$Time,sep=" "),format="%d/%m/%Y %T")
file$Date<-as.Date(paste(file$Date,file$Time),format="%d/%m/%Y")
#select data we will be using
data<-subset(file,Date>="2007-02-01"&Date<="2007-02-02")

#Export
png("plot4.png",width=480,height=480)

#set columns and rows. fill by column
par(mfcol=c(2,2))

#plot plot2
plot(data$Timestamp,data$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(data$Timestamp,data$Global_active_power)

#set colors
colors=c("black","red","blue")
#plot plot3
with(data, plot(Timestamp,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
lines(data$Timestamp,data$Sub_metering_1,col=colors[1])
lines(data$Timestamp,data$Sub_metering_2,col=colors[2])
lines(data$Timestamp,data$Sub_metering_3,col=colors[3])
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),title="",lty=1,col=colors)

#plot the other two graphs

with(data,plot(Timestamp,Voltage,xlab="datetime",ylab="Voltage",type="n"))
with(data,lines(Timestamp,Voltage))

with(data,plot(Timestamp,Global_reactive_power,xlab="datetime",type="n"))
with(data,lines(Timestamp,Global_reactive_power))
     
dev.off()
