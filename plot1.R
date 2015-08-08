plot1 <- function () {
        setwd("~/GitHub/Exploratory Data Analysis/Week 1")
        ## read the UCI data
        labels <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", 
                             nrows = 1)
        
        headers <- unname(unlist(labels[1,]))
        
        data <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", 
                           skip=grep("1/2/2007", readLines("household_power_consumption.txt")),
                           nrows=2880, col.names = as.vector(headers), na.strings = "?")
        par(new)
        par(mfrow = c(1,1), bg = "transparent", family = "sans")
        with(data, hist(Global_active_power, xlab = "Global Active Power (kilowatts)", 
                        main = "Global Active Power", col = "red"))
        dev.copy(png, "plot1.png")
        dev.off()
}