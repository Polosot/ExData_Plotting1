plot1 <- function()
{
    ## Loading the data
    
    ## This code reads the data from just needed dates (2007-02-01 and 2007-02-02) by specify a fixed range of rows.
    ## Generally, is a bad idea because no guaranty that the data file wasn't changed and data is odered by a date.
    r <- read.csv2("household_power_consumption.txt", header=FALSE, dec=".", na.strings="?", skip=66637, nrows=2880)
    ## Read the 1st row with column names
    col_names <- dimnames(read.csv2("household_power_consumption.txt", header=TRUE, dec=".", na.strings="?", nrows=1))[[2]]
    dimnames(r)[[2]] <- col_names

    ## Making Plots
    
    png(filename = "plot1.png", width = 480, height = 480)
    hist(r$Global_active_power, col="red", xlab="Global active power (kilowatts)", main="Global active power")
    dev.off()
}