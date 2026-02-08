# (Include Loading Logic Here)
# 1. Load the data from the text file
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")

# 2. Subset the data for the specific dates required
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# 3. Convert variables to numeric/date-time formats for plotting
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
