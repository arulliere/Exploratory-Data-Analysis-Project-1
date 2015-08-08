plot3 <- function () {
        setwd("~/GitHub/Exploratory Data Analysis/Week 1")
        ## read the UCI data
        labels <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", 
                             nrows = 1)
        
        headers <- unname(unlist(labels[1,]))
        
        data <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", 
                           skip=grep("1/2/2007", readLines("household_power_consumption.txt")),
                           nrows=2880, col.names = as.vector(headers), na.strings = "?")
        
        data$Datetime <- strptime(paste(data$Date, data$Time, sep = " ", collapse = NULL),"%d/%m/%Y %H:%M:%S")
        
        par(new)
        par(bg = "transparent")
        with(data, 
             plot(Datetime, Sub_metering_1, xlab = "",
                  ylab = "Energy sub metering", type = "l"))        
        with(data, lines(Datetime, Sub_metering_2, col = "red"))
        with(data, lines(Datetime, Sub_metering_3, col = "blue"))
        legend("topright", lty = 1, cex = 0.8, col = c("black", "blue", "red"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        dev.copy(png, "plot3.png")
        dev.off()
}