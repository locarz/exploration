# Neal Gushue, 2015
# Load full dataset, careful with the data / time cols as characters, not factors
src_data <- read.csv("./household_power_consumption.txt", sep=";", na.strings = "?", stringsAsFactors = FALSE)
# Filter data to required working date range
working_dataset <- src_data[(src_data$Date == "1/2/2007" | src_data$Date == "2/2/2007"),]
# Build graphs..
# Output will be a png file 
png(filename = "plot1.png", width = 480, height = 480)
# Build histogram
hist(working_dataset$Global_active_power, col="red", xlab = "Global Active Power (Kilowatts)", main = "Global Active Power")
# Close device
dev.off()
