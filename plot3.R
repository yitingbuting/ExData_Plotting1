file <- "household_power_consumption.txt"
data <- read.table(file, sep=";", header=TRUE, na.strings="?")
data <- data[grep("^1/2/2007$|^2/2/2007$",data$Date),]
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_ALL", "en_US")

plot(data$Date,data$Sub_metering_1, type="l",ylab="Energy sub metering",xlab="")
lines(data$Date,data$Sub_metering_2, type="l", col="red")
lines(data$Date,data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=names(data[7:9]), lty=1, col=c("black","red","blue"))
dev.copy(png,file="plot3.png")
dev.off()