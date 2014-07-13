#setwd("C:\\Users\\Jay\\Documents\\GitHub\\ExData_Plotting1")

plot2 = function(filename="household_power_consumption.txt"){
  ## Get header names
  header = names(read.table(filename, header=T, sep=";", skip=0, nrows=2))
  
  ## Set start and end point for reading file
  read.start = 66637
  read.end = 2880
  
  ## Load data for Feb. 1-2, 2007
  data = read.table(filename, sep=";", 
                    skip=read.start, 
                    nrows=read.end, 
                    col.names=header)
  #print(header)
  main = ""
  ylab = "Global Active Power (kilowatts)"
  
  png("plot2.png")
  par(mar=c(4,4,2,2))
  plot(data$Global_active, ylab=ylab, xlab="", type="l", axes=F)
  axis(1, at=c(1,1440,2880), lab=c("Thu","Fri","Sat"))
  axis(2, at=c(0,2,4,6), lab=c(0,2,4,6))
  box()
  dev.off()
}