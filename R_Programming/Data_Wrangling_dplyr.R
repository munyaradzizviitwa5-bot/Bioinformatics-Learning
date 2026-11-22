
# ==========================================
# Basic Data Wrangling Using dplyr
# HarvardX Data Science: R Basics
# ==========================================

# 1. Install and load dplyr
# Install only once if the package is not already installed
install.packages("dplyr")

library(dplyr)
library(dslabs)

# 2. Load the murders dataset
data("murders")

# 3. Create a new column using mutate()
# Calculate murder rate per 100,000 people

murders <- mutate(
  murders,
  rate = total / population * 100000
)

# 4. Filter rows using filter()
# Select states with a murder rate <= 0.71

low_rate_states <- filter(murders, rate <= 0.71)

# 5. Select columns using select()
# Keep only state, region and rate

new_table <- select(murders, state, region, rate)

# 6. Combine select() and filter() using the pipe operator

final_table <- murders %>%
  select(state, region, rate) %>%
  filter(rate <= 0.71)

# 7. View the results

head(final_table)
dim(final_table)

# ==========================================
# Creating Data Frames in R
# HarvardX Data Science: R Basics
# ==========================================

# Create a data frame containing student names
# and examination scores

grades <- data.frame(
  names = c("John", "Juan", "Jean", "Yao"),
  exam_1 = c(85, 80, 90, 85),
  exam_2 = c(90, 85, 95, 90),
  stringsAsFactors = FALSE
)

# Display the data frame
print(grades)

# Check the structure of the data frame
str(grades)

# Check the data type of the names column
class(grades$names)


# ==========================================
# Summarizing Data Using dplyr
# HarvardX Data Science: R Basics
# ==========================================

# 1. Load packages
library(tidyverse)
library(dplyr)
library(dslabs)

# 2. Load the murders dataset
data("murders")

# 3. Calculate the murder rate per 100,000 people
murders <- mutate(
  murders,
  rate = total / population * 10^5
)

# 4. Calculate minimum, median and maximum
# murder rates for states in the West region

s <- murders %>%
  filter(region == "West") %>%
  summarize(
    minimum = min(rate),
    median = median(rate),
    maximum = max(rate)
  )

# 5. Display the summary table
s

# 6. Access individual summary values
s$median
s$maximum

# 7. Calculate the unweighted average murder rate
mean(murders$rate)

# 8. Calculate the population-weighted national murder rate
us_murder_rate <- murders %>%
  summarize(
    rate = sum(total) / sum(population) * 10^5
  )

# 9. Display the national murder rate
us_murder_rate


# =========================================================
# Summarizing Data Using dplyr
# HarvardX Data Science: R Basics
# =========================================================

# 1. Load required packages

library(tidyverse)
library(dplyr)
library(dslabs)

# 2. Load the murders dataset

data("murders")

# 3. Calculate the murder rate per 100,000 people

murders <- mutate(
  murders,
  rate = total / population * 10^5
)

# 4. Calculate minimum, median, and maximum murder rates
#    for states in the Western region using quantile()
#    This returns the three values as a vector.

murders %>%
  filter(region == "West") %>%
  summarize(range = quantile(rate, c(0, 0.5, 1)))

# 5. Create a custom function that returns
#    minimum, median, and maximum as a data frame

my_quantile <- function(x) {
  
  # Calculate the minimum, median, and maximum
  r <- quantile(x, c(0, 0.5, 1))
  
  # Return the results as separate columns
  data.frame(
    minimum = r[1],
    median = r[2],
    maximum = r[3]
  )
}

# 6. Apply the custom function using summarize()
#    for states in the Western region

murders %>%
  filter(region == "West") %>%
  summarize(my_quantile(rate))

# 7. Access individual columns from the summarized data frame

s <- murders %>%
  filter(region == "West") %>%
  summarize(my_quantile(rate))

s$minimum
s$median
s$maximum

# 8. Calculate the unadjusted average murder rate
#    This is the ordinary mean of the state-level rates.

mean(murders$rate)

# 9. Calculate the population-adjusted murder rate
#    This calculates the total murders divided by
#    the total population, multiplied by 100,000.

us_murder_rate <- murders %>%
  summarize(
    rate = sum(total) / sum(population) * 10^5
  )

us_murder_rate

# ============================================================
# 11. Using pull() to Extract Numeric Values
# HarvardX Data Science: R Basics
# ============================================================

# 1. Load required packages
library(tidyverse)
library(dplyr)
library(dslabs)

# 2. Load the murders dataset
data(murders)

# 3. Calculate the murder rate for each state
murders <- mutate(
  murders,
  rate = total / population * 10^5
)

# Calculate the population-adjusted average murder rate.
# This divides total murders by total population
# and multiplies the result by 100,000.

us_murder_rate <- murders %>%
  summarize(
    rate = sum(total) / sum(population) * 10^5
  )

# Display the result
us_murder_rate

# Check the object class.
# summarize() returns a data frame (tibble).

class(us_murder_rate)

# Extract the rate column as a numeric vector.
# pull() removes the data-frame structure.

us_murder_rate %>%
  pull(rate)

# Save the extracted numeric value directly.
us_murder_rate <- murders %>%
  summarize(
    rate = sum(total) / sum(population) * 10^5
  ) %>%
  pull(rate)

# Display the numeric result
us_murder_rate

# Check the new object class.
class(us_murder_rate)

# ============================================================
# 12. The Dot Placeholder (.)
# HarvardX Data Science: R Basics
# ============================================================

# The dot (.) acts as a placeholder for data
# being passed through a pipe.
library(tidyverse)
library(dplyr)
library(dslabs)
data(murders)
murders <- mutate(murders, rate = total / population * 10^5)

# Calculate the population-adjusted average murder rate.

us_murder_rate <- murders %>%
  summarize(
    rate = sum(total) / sum(population) * 10^5
  )

# Display the result as a data frame.
us_murder_rate

# Use the dot placeholder to access the rate column.
us_murder_rate <- murders %>%
  summarize(
    rate = sum(total) / sum(population) * 10^5
  ) %>%
  .$rate

# Display the extracted numeric value.
us_murder_rate

# Check the object's class.
class(us_murder_rate)

# Group by region
murders %>% 
  group_by(region)

# Summarize after grouping
murders %>%
  group_by(region) %>%
  summarize(median = median(rate))


