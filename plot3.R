## Generate Plot 1

ESTIMATESIZE   <- FALSE
SHOWCLASSES    <- FALSE
WORKDIR        <- "C:/data/backedup/trabalho/pessoais/formação/2015/15.06 Data Science Specialization/04 Exploratory Data Analysis/assignment 1/"
DATAFILE       <- "household_power_consumption.txt"

## Load other scripts
setwd(WORKDIR)
source("loaddata.R")

## Get the data
getTheData()

## Work on the plot
with(dtfPowerConsumption, plot(Time , Sub_metering_1, xlab="", ylab="Energy sub metering", type="n"))
with(dtfPowerConsumption, lines(Time, Sub_metering_1, col="black"))
with(dtfPowerConsumption, lines(Time, Sub_metering_2, col="red"))
with(dtfPowerConsumption, lines(Time, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))
dev.copy(png, file="plot3.png", width = 480, height = 480)
dev.off()

## source("plot3.R")