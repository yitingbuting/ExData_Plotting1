file <- "household_power_consumption.txt"
data <- read.table(file, sep=";", header=TRUE, na.strings="?")
data <- data[grep("^1/2/2007$|^2/2/2007$",data$Date),]
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_ALL", "en_US")


par(mfcol=c(2,2))
plot(data$Date,data$Global_active_power, type="l",ylab="Global Active Power",xlab="")
plot(data$Date,data$Sub_metering_1, type="l",ylab="Energy sub metering",xlab="")
lines(data$Date,data$Sub_metering_2, type="l", col="red")
lines(data$Date,data$Sub_metering_3, type="l", col="blue")
legend("topright", box.lwd=0, legend=names(data[7:9]), lty=1, col=c("black","red","blue"), cex=0.7)
plot(data$Date,data$Voltage, type="l",ylab="Voltage",xlab="datetime")
plot(data$Date,data$Global_reactive_power, type="l",ylab="Global_reactive_power",xlab="datetime")

dev.copy(png,file="plot4.png")
dev.off()