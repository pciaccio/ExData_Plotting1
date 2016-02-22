plot1<-function(){
  
  ### reads in the text file from the working directory, reformats the Date column, and the numeric variables 
  ### and subsets the data to include dates for2/1/2007 and 2/2/2007
  
  data<-read.csv("household_power_consumption.txt",header=TRUE,sep=";")
  data$Date<-as.Date(data$Date,format="%d/%m/%Y")
  data<-subset(data,Date>="2007-02-01" & Date<="2007-02-02")
  data2<-as.numeric(as.character(data$Global_active_power))
  
  ### opens a PNG file 
  png("plot1.png",width=480,height=480)
  hist(data2,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
  dev.off() ### Closes thePNG file
  
  }
