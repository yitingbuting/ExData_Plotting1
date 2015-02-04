file <- "household_power_consumption.txt"
data <- read.table(file, sep=";", header=TRUE, na.strings="?")
data <- data[grep("^1/2/2007$|^2/2/2007$",data$Date),]
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png")
dev.off()