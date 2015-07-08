##
## The file expects the following global variables:
## - dtfPowerConsumption: the dataframe that holds the data
## - ESTIMATESIZE: a boolean that indicates if we want to estimate the data frame size
## - SHOWCLASSES: a bolean that indicates if we want to print out the classes of the column in the dataframe
##

## Estinmate size by reading first N rows
estimateDataFrameSize <- function(chrFileName, intNumRows=2, ...) {
        dtfTestData <- read.csv(chrFileName, nrows=intNumRows,...)
        intRowSize <- object.size(dtfTestData)
        dtfTestData <- dtfTestData[1,]
        intRowSize <- (intRowSize - object.size(dtfTestData))/(intNumRows - 1)
}

## Just reads a CSV file
justLoadDataFrame <- function(chrFileName, ...) {
        read.csv(chrFileName, ...)
}

## Loads data from the Power Consumption CSV file and performs the necessary transformations
loadDataFrame <- function(chrFileName, ...) {
        dtfPowerConsumption <<- justLoadDataFrame(chrFileName, ...)
        ## Filter the dates to report on
        dtfPowerConsumption <<- dtfPowerConsumption[dtfPowerConsumption$Date == "1/2/2007" | dtfPowerConsumption$Date == "2/2/2007",]
        ## Change columns Date and Time to Date and POSIXlt
        dtfPowerConsumption$Date <<- as.Date(strptime(dtfPowerConsumption$Date, format="%d/%m/%Y"))
        dtfPowerConsumption$Time <<- strptime(paste(dtfPowerConsumption$Date, dtfPowerConsumption$Time), format="%Y-%m-%d %H:%M:%S")
}

## Runs the entire thing
getTheData <- function() {
        ## Estimate data size
        if(ESTIMATESIZE) {
                intRowSize <- estimateDataFrameSize(DATAFILE, intNumRows=10, sep=";", header=TRUE, na.strings="?")
                message(paste("Estimated size of the 2,075,259 of data rows to load", round(2075259*intRowSize/1024/1024), "MB"))
                if(SHOWCLASSES) {
                        print(sapply(dtfPowerConsumption, class)) ## Confirm data types
                }
                loadDataFrame(DATAFILE, sep=";", header=TRUE, na.strings="?")
                if(SHOWCLASSES) {
                        print(sapply(dtfPowerConsumption, class)) ## Confirm data types
                }
        }
        
        
        ## Check if data is alreday loaded
        if(!exists("dtfConsumptionData")) {
                loadDataFrame(DATAFILE, sep=";", header=TRUE, na.strings="?")
        }
}