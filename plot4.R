plot4<-function(){
  
  ### reads in the text file from the working directory, reformats the Date column, and the numeric variables 
  ### and subsets the data to include dates for2/1/2007 and 2/2/2007
  
  data<-read.csv("household_power_consumption.txt",header=TRUE,sep=";")
  data$Date<-as.Date(data$Date,format="%d/%m/%Y")
  data<-subset(data,Date>="2007-02-01" & Date<="2007-02-02")
  data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
  data$Voltage<-as.numeric(as.character(data$Voltage))
  data$Global_reactive_power<-as.numeric(as.character(data$Global_reactive_power))
  data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1))
  data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2))
  data$Sub_metering_3<-as.numeric(as.character(data$Sub_metering_3))
  
  ### creates a column combining the Date and Time
  x<-paste(data$Date,data$Time)
  y<-strptime(x,"%Y-%m-%d %H:%M:%S")
  data<-cbind(data,y)

  ### opens a PNG file 
  png("plot4.png",width=480,height=480)

  par(mfrow=c(2,2)) ### creates a matrix of 4 graphs
  
  plot(data$y,data$Global_active_power,type="l",ylab="Global Active Power",xlab="") ### Graph 1
  
  plot(data$y,data$Voltage,type="l",ylab="Voltage",xlab="datetime") ### Graph 2
    
  with(data,{ ### Graph 3
    plot(y,Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
    points(y,Sub_metering_2,type="l",col="red")
    points(y,Sub_metering_3,type="l",col="blue")
    })
  legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,bty="n",cex=.9)
  
  plot(data$y,data$Global_reactive_power,type="l",xlab="datetime", ylab="Global_reactive_power") ### Graph 4
  
  dev.off() ### Closes thePNG file
  
  }
