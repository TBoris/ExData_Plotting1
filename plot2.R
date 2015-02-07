fname <- 'household_power_consumption.txt'
Sys.setlocale('LC_TIME', 'en_US')

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
x <- strptime(strsplit(paste(observations$Date, observations$Time, sep=''), ' '), 
              '%d/%m/%Y%H:%M:%S')
png(filename='plot2.png', width=480, height=480)

plot(x, observations$Global_active_power, type="n", 
     xlab='', ylab='Global Active Power (kilowatts)')
lines(x, observations$Global_active_power)

dev.off()