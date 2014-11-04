file<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",stringsAsFactors=FALSE)
file$Timestamp<-strptime(paste(file$Date,file$Time,sep=" "),format="%d/%m/%Y %T")
file$Date<-as.Date(paste(file$Date,file$Time),format="%d/%m/%Y")
data<-subset(file,Date>="2007-02-01"&Date<="2007-02-02"")