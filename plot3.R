plot3<-function(){
  
  ### reads in the text file from the working directory, reformats the Date column, and the numeric variables 
  ### and subsets the data to include dates for2/1/2007 and 2/2/2007
  
  data<-read.csv("household_power_consumption.txt",header=TRUE,sep=";")
  data$Date<-as.Date(data$Date,format="%d/%m/%Y")
  data<-subset(data,Date>="2007-02-01" & Date<="2007-02-02")
  data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1))
  data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2))
  data$Sub_metering_3<-as.numeric(as.character(data$Sub_metering_3))
  
  ### creates a column combining the Date and Time
  x<-paste(data$Date,data$Time)
  y<-strptime(x,"%Y-%m-%d %H:%M:%S")
  data<-cbind(data,y)

  ### opens a PNG file 
  png("plot3.png",width=480,height=480)
  
  with(data,{
    plot(y,Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
    points(y,Sub_metering_2,type="l",col="red")
    points(y,Sub_metering_3,type="l",col="blue")
    })
  legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)

  dev.off() ### Closes thePNG file
  
  }
