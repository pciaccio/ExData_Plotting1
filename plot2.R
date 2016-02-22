plot2<-function(){
  
  ### reads in the text file from the working directory, reformats the Date column, and the numeric variables 
  ### and subsets the data to include dates for2/1/2007 and 2/2/2007
  
  data<-read.csv("household_power_consumption.txt",header=TRUE,sep=";")
  data$Date<-as.Date(data$Date,format="%d/%m/%Y")
  data<-subset(data,Date>="2007-02-01" & Date<="2007-02-02")
  data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
  
  ### creates a column combining the Date and Time
  x<-paste(data$Date,data$Time)
  y<-strptime(x,"%Y-%m-%d %H:%M:%S")
  data<-cbind(data,y)
  
  ### opens a PNG file 
  png("plot21.png",width=480,height=480)
  plot(data$y,data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
  dev.off() ### Closes thePNG file
  
  }
