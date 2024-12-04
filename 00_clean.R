# Check if 'tidyverse' package is installed, if not, install it
if (!requireNamespace("tidyverse", quietly = TRUE)) {
  install.packages("tidyverse")
}
# Check if 'nycflights13' package is installed, if not, install it
if (!requireNamespace("nycflights13", quietly = TRUE)) {
  install.packages("nycflights13")
}
# Load the 'tidyverse' package and suppress startup messages
suppressPackageStartupMessages(library(tidyverse))
# Load the 'nycflights13' package
library(nycflights13)

# Load the 'flights' dataset from 'nycflights13' package
data("flights")
# Display the first few rows of the 'flights' dataset
head(flights)

# Select relevant columns and join with 'airlines' dataset to get full airline names
flights_clean <- flights %>%
  select(year, month, day, dep_delay, arr_delay, carrier) %>%
  left_join(airlines, by = "carrier")

# Print the cleaned data to inspect
head(flights_clean)
