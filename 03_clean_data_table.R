# Check if 'tidyverse' package is installed, if not, install it
if (!requireNamespace("tidyverse", quietly = TRUE)) {
  install.packages("tidyverse")
}
# Check if 'nycflights13' package is installed, if not, install it
if (!requireNamespace("nycflights13", quietly = TRUE)) {
  install.packages("nycflights13")
}
# Check if 'data.table' package is installed, if not, install it
if (!requireNamespace("data.table", quietly = TRUE)) {
  install.packages("data.table")
}
# Load the 'tidyverse' package and suppress startup messages
suppressPackageStartupMessages(library(tidyverse))
# Load the 'nycflights13' package
library(nycflights13)
# Load the 'data.table' package
library(data.table)


# Convert 'flights' dataset to data.table format
flights_dt <- as.data.table(flights)
# Convert 'airlines' dataset to data.table format
airlines_dt <- as.data.table(airlines)

# Select relevant columns
flights_clean_dt <- flights_dt[, .(year, month, day, dep_delay, arr_delay, carrier)]

# Print the cleaned data to inspect
head(flights_clean_dt)

