# Neal Gushue, 2015
# Load full working_datasetset, careful with the working_dataset / time cols as characters, not factors
src_working_dataset <- read.csv("./household_power_consumption.txt", sep=";", na.strings = "?", stringsAsFactors = FALSE)
# Filter working_dataset to required working date range
working_working_datasetset <- src_working_dataset[(src_working_dataset$Date == "1/2/2007" | src_working_dataset$Date == "2/2/2007"),]
# build new column to enable displaying the weekday word + time points simple.  LT Format
working_working_datasetset$fulldate = strptime(paste(working_working_datasetset$Date, working_working_datasetset$Time), "%d/%m/%Y %H:%M:%S")
# Build graphs.
png(filename = "plot3.png", width = 480, height = 480)
plot(c(working_dataset$fulldate,working_dataset$fulldate,working_dataset$fulldate), c(working_dataset$Sub_metering_1, working_dataset$Sub_metering_2, working_dataset$Sub_metering_3), type = "n", ylab = "Energy sub metering", xlab="")
lines(working_dataset$fulldate, working_dataset$Sub_metering_1, col="black")
lines(working_dataset$fulldate, working_dataset$Sub_metering_2, col="red")
lines(working_dataset$fulldate, working_dataset$Sub_metering_3, col="blue")
legend("topright", c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), lty=c(1,1), col=c("black", "red", "blue"))
# Close device
dev.off()

