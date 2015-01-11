plot4 <- function()
{
    ## Loading the data
    
    ## This code reads the data from just needed dates (2007-02-01 and 2007-02-02) by specify a fixed range of rows.
    ## Generally, is a bad idea because no guaranty that the data file wasn't changed and data is odered by a date.
    r <- read.csv2("household_power_consumption.txt", header=FALSE, dec=".", na.strings="?", skip=66637, nrows=2880)
    ## Read the 1st row with column names
    col_names <- dimnames(read.csv2("household_power_consumption.txt", header=TRUE, dec=".", na.strings="?", nrows=1))[[2]]
    dimnames(r)[[2]] <- col_names
    r$DateTime <- strptime(paste(r$Date, r$Time), "%d/%m/%Y %H:%M:%S")
    
    ## Making Plots
    
    png(filename = "plot4.png", width = 480, height = 480)
    par(mfrow=c(2,2))
    ## 1st plot - like "plot2"
    plot(r$DateTime, r$Global_active_power, type="l", ylab = "Global active power", xlab="", main="")
    ## 2nd plot
    plot(r$DateTime, r$Voltage, type="l", ylab = "Voltage", xlab="DateTime", main="")
    ## 3d plot - like "plot3"
    plot(r$DateTime, r$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="", main="")
    points(r$DateTime, r$Sub_metering_2, type="l", col="red")
    points(r$DateTime, r$Sub_metering_3, type="l", col="blue")
    legend("topright", lwd=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")
    ## 4th plot
    plot(r$DateTime, r$Global_reactive_power, type="l", xlab="DateTime", ylab = "Global reactive power", main="")
    
    dev.off()
}