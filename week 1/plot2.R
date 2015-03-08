# Neal Gushue, 2015
# Load full dataset, careful with the data / time cols as characters, not factors
src_data <- read.csv("./household_power_consumption.txt", sep=";", na.strings = "?", stringsAsFactors = FALSE)
# Filter data to required working date range
working_dataset <- src_data[(src_data$Date == "1/2/2007" | src_data$Date == "2/2/2007"),]
# build new column to enable displaying the weekday word + time points simple.  LT Format
working_dataset$fulldate = strptime(paste(working_dataset$Date, working_dataset$Time), "%d/%m/%Y %H:%M:%S")
# Build graphs.
png(filename = "plot2.png", width = 480, height = 480)
plot(working_dataset$fulldate, working_dataset$Global_active_power, type = "n", ylab = "Global Active Power (Kilowatts)", xlab="")
lines(working_dataset$fulldate, working_dataset$Global_active_power)
# Close device
dev.off()
