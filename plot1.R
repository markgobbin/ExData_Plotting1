#read data with ? as NA
file<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",stringsAsFactors=FALSE)
#process dates and times
file$Timestamp<-strptime(paste(file$Date,file$Time,sep=" "),format="%d/%m/%Y %T")
file$Date<-as.Date(paste(file$Date,file$Time),format="%d/%m/%Y")
#select data we will be using
data<-subset(file,Date>="2007-02-01"&Date<="2007-02-02")

#To export:
png("plot1.png",width=480,height=480)
hist(data$Global_active_power,col="orangered",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off() 