#setwd("C:\\Users\\Jay\\Documents\\GitHub\\ExData_Plotting1")

plot1 = function(filename="household_power_consumption.txt"){
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
  print(header)
  main = "Global Active Power"
  xlab = "Global Active Power (kilowatts)"
  
  png("plot1.png")
  par(mar=c(4,4,2,2))
  hist(data$Global_active, main=main, xlab=xlab, col="red")
  dev.off()
}