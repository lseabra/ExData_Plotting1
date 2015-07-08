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
with(dtfPowerConsumption, plot(Time , Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="n"))
with(dtfPowerConsumption, lines(Time, Global_active_power))
dev.copy(png, file="plot2.png", width = 480, height = 480)
dev.off()

## source("plot2.R")