# Source the cleaning script
source("03_clean_data_table.R")

# Measure and print the execution time of the analysis
system.time({
  # Calculate the mean departure and arrival delays for each airline
  flights_means <- flights_clean %>%
    group_by(carrier) %>%
    summarize(mean_dep_delay = mean(dep_delay, na.rm = TRUE),
              mean_arr_delay = mean(arr_delay, na.rm = TRUE)) %>%
    arrange(mean_dep_delay)
  
  # Join the airline names to the flights_means dataset
  flights_means <- flights_means %>%
    left_join(airlines, by = "carrier") %>%
    select(name, mean_dep_delay, mean_arr_delay)
  
  # Print the result to inspect
  print(flights_means)
})

# According to the results I got from tidyverse and data table, 
# in tidyverse I got user  system elapsed 
#                    0.018   0.008   0.037 
# in data table i got user  system elapsed 
#.                   0.018   0.004   0.023 
#  When compared to elapse results i can say that analysis using data table is more speed than anlysis using tidyverse.
