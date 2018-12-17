#Dataset in R
date_time <- function(date, time) {
    return(strptime(paste(date, time), "%d/%m/%Y %H:%M:%S"))
}

load_data <- function() {
    load_file <- "household_power_consumption.txt"
    df <- read.table(filename, header = TRUE, sep = ";", na="?",
    colClasses=c("character", "character", rep("numeric", 7)))
    
    #Convert data and time to Date &Time class
    df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
    df$Date <- as.Date(df$Date, "%d/%m/%Y")
    
    #Use data from the dates 2007/02/01 and 2007/02/02
    dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
    df <- subset(df, Date %in% dates)
    return(df)
}
