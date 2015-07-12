# Include relevant libraries
library(graphics) # Basic plotting

# Create variables capturing problem inputs
DATA_DIR = ".." # Specify the data directory here
DATA_FILE = paste(DATA_DIR, "/household_power_consumption.txt", sep="")
dates_of_interest <- c("1/2/2007", "2/2/2007")

# Determine png file name, by getting current script name 
# and substituting .R with .png
png_file <- sub(".R", ".png", basename((sys.frame(1)$ofile)))

# Open png device as needed
png(png_file, width=480, height=480)

# Read all the power, as a 'CSV', where we have a header line and the separator is ';'
df_household_power <- read.table(file=DATA_FILE, sep=";", na.strings="?", head=TRUE)

# Get power data for dates of interest
df_sub_household_power <- subset(df_household_power, Date %in% dates_of_interest)

# Create histogram plot
with(df_sub_household_power, 
     hist(Global_active_power, 
          main="Global Active Power", 
          xlab = "Global Active Power (kilowatts)", 
          col="red"))

# close the png device
dev.off()