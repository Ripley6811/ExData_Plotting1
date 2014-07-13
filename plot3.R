#setwd("C:\\Users\\Jay\\Documents\\GitHub\\ExData_Plotting1")

plot3 = function(topng=T, filename="household_power_consumption.txt"){
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
  
  ## Set main heading and y-axis label.
  main = ""
  ylab = "Energy sub metering"
  
  ## Connect to a new PNG output
  if(topng == TRUE){
    png("plot3.png")
  }
  
  ## Set size of graph.
  par(mar=c(4,4,2,2))
  
  ## Create plot but turn off auto-labeling of axes.
  plot(data$Sub_metering_1, ylab=ylab, xlab="", type="l", axes=F)
  lines(data$Sub_metering_2, lty=1, col="red")
  lines(data$Sub_metering_3, lty=1, col="blue")
  
  ## Label the axis tick marks.
  axis(1, at=c(1,1440,2880), lab=c("Thu","Fri","Sat"))
  axis(2, at=c(0,10,20,30), lab=c(0,10,20,30))
  
  ## Add a box around plot.
  box()
  
  ## Add a legend in top right corner
  leg.names = names(data)[7:9]
  colors = c("black", "red", "blue")
  legend("topright", legend=leg.names, col=colors, lty=1)
  
  ## Close PNG output
  if(topng == TRUE){
    dev.off()
  }
}