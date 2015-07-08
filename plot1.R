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
with(dtfPowerConsumption, hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power"))
dev.copy(png, file="plot1.png", width = 480, height = 480)
dev.off()

## source("plot1.R")