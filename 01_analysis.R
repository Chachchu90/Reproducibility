# Execute the cleaning script
source("00_clean.R")

# Calculate mean delays

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
