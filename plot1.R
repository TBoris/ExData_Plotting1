fname <- 'household_power_consumption.txt'

# Determine skipped rows amount.
date_fmt <- '%d/%m/%Y %H:%M:%S'
file_start_date <- strptime('16/12/2006 17:24:00', date_fmt)
start_data_date <- strptime('01/02/2007 00:01:00', date_fmt)
end_data_date <- strptime('03/02/2007 00:01:00', date_fmt)
skip_rows <- as.numeric(difftime(start_data_date, file_start_date, units='mins'))
num_rows <- as.numeric(difftime(end_data_date, start_data_date, units='mins'))

# Read the data.
observations <- read.table(fname, skip=skip_rows, nrows=num_rows, 
                           sep=';',
                          na.strings="?",
                          col.names=names(read.csv2(fname, nrows=1)))

# Plot the data
png(filename='plot1.png', width=480, height=480)
hist(observations$Global_active_power, col="red", 
     xlab='Global Active Power (kilowatts)', main='Global Active Power')
dev.off()