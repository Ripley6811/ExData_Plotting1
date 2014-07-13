#setwd("C:\\Users\\Jay\\Documents\\GitHub\\ExData_Plotting1")

plot4 = function(topng=T, filename="household_power_consumption.txt"){
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
    png("plot4.png")
  }
  
  ## Set size of graph.
  par(mfrow=c(2,2), mar=c(4,4,4,2))
  
  ##### Create Plot (1,1) #####
  main = ""
  ylab = "Global Active Power"
  
  plot(data$Global_active, ylab=ylab, xlab="", type="l", axes=F)
  axis(1, at=c(1,1440,2880), lab=c("Thu","Fri","Sat"))
  axis(2, at=c(0,2,4,6), lab=c(0,2,4,6))
  box()
  
  
  ##### Create Plot (1,2) #####
  main = ""
  ylab = "Voltage"
  xlab = "datetime"
  y.axis = c(234,236,238,240,242,244,246)
  
  plot(data$Voltage, ylab=ylab, xlab=xlab, type="l", axes=F)
  axis(1, at=c(1,1440,2880), lab=c("Thu","Fri","Sat"))
  axis(2, at=y.axis, lab=y.axis)
  box()
  
  
  ##### Create Plot (2,1) #####
  main = ""
  ylab = "Energy sub metering"
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
  legend("topright", legend=leg.names, col=colors, lty=1, bty="n")
  
  
  ##### Create Plot (2,2) #####
  main = ""
  ylab = "Global_reactive_power"
  xlab = "datetime"
  y.ticks = c(0.0,0.1,0.2,0.3,0.4,0.5)
  y.labels = c("0.0","0.1","0.2","0.3","0.4","0.5")
  
  plot(data$Global_reactive, ylab=ylab, xlab=xlab, type="l", axes=F)
  axis(1, at=c(1,1440,2880), lab=c("Thu","Fri","Sat"))
  axis(2, at=y.ticks, lab=y.labels)
  box()
  
  
  
  
  ## Close PNG output
  if(topng == TRUE){
    dev.off()
  }
}