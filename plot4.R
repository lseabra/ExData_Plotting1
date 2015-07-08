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
par(mfrow=c(2,2), cex=0.7)
with(dtfPowerConsumption, {
        ## top left
        with(dtfPowerConsumption, plot(Time , Global_active_power, xlab="", ylab="Global Active Power", type="n"))
        with(dtfPowerConsumption, lines(Time, Global_active_power))
        ## top right
        with(dtfPowerConsumption, plot(Time , Voltage, xlab="datetime", ylab="Voltage", type="n"))
        with(dtfPowerConsumption, lines(Time, Voltage))
        ## bottom left
        with(dtfPowerConsumption, plot(Time , Sub_metering_1, xlab="", ylab="Energy sub metering", type="n"))
        with(dtfPowerConsumption, lines(Time, Sub_metering_1, col="black"))
        with(dtfPowerConsumption, lines(Time, Sub_metering_2, col="red"))
        with(dtfPowerConsumption, lines(Time, Sub_metering_3, col="blue"))
        legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))
        ## bottom right
        ##with(dtfPowerConsumption, barplot(Global_reactive_power, names.arg=format(Time,"%a"), xlab="datetime", ylab="Global_reactive_power"))
        with(dtfPowerConsumption, barplot(Global_reactive_power, xlab="datetime", ylab="Global_reactive_power"))
        axis(side = 1, at = c(1, 1440, 2880), labels=c("qui", "sex", "sáb"))
})
dev.copy(png, file="plot4.png", width = 480, height = 480)
dev.off()

## source("plot4.R")