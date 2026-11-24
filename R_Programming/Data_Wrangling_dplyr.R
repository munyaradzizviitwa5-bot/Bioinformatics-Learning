
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

# ==========================================
#  Sorting Data Tables with dplyr
# ==========================================

# Order states by population size (ascending)
murders %>%
  arrange(population) %>%
  head()

# Order states by murder rate (ascending)
murders %>%
  arrange(rate) %>%
  head()

# Order states by murder rate (descending)
murders %>%
  arrange(desc(rate)) %>%
  head()

# Order states by region, then murder rate within each region
murders %>%
  arrange(region, rate) %>%
  head()

# Select the top 10 states by murder rate
murders %>%
  top_n(10, rate)

# Select the top 10 states by murder rate
# and display them in descending order
murders %>%
  arrange(desc(rate)) %>%
  top_n(10)

# Select the 10 states with the highest murder rates
murders %>%
  slice_max(order_by = rate, n = 10)


# ============================================================
# DATA MANIPULATION USING data.table
# HarvardX Data Science: R Basics
# Dataset: murders (dslabs package)
# ============================================================

# 1. Install and load packages
# Installation is needed only once.
# install.packages("data.table")

library(data.table)
library(dplyr)
library(dslabs)

# Load dataset
data(murders)

# 2. Convert data frame into a data.table
murders_dt <- setDT(copy(murders))

# Display first six rows
head(murders_dt)

# 3. Selecting columns using dplyr
select(murders, state, region)

# 4. Selecting columns using data.table

# Method 1
murders_dt[, c("state", "region"), with = FALSE] |> head()

# Method 2
murders_dt[, .(state, region)] |> head()

# 5. Adding a column using dplyr
murders_dplyr <- mutate(
  murders,
  rate = total / population * 100000
)

head(murders_dplyr)

# 6. Adding a column using data.table
murders_dt[, rate := total / population * 100000]

head(murders_dt)

# 7. Adding multiple columns using data.table
murders_dt[, `:=`(
  rate = total / population * 100000,
  population_millions = population / 1000000
)]

head(murders_dt)

# 8. Understanding update by reference

x <- data.table(a = 1)
y <- x

# Modify x by reference
x[, a := 2]

print(x)
print(y)

# Both show the updated value because they refer
# to the same underlying data.table.

# 9. Creating an independent copy using copy()

x <- data.table(a = 1)
y <- copy(x)

# Modify x
x[, a := 2]

print(x)
print(y)

# x is now 2, while y remains 1.

# 10. Summary
# data.table provides efficient data manipulation.
# := adds or updates columns by reference.
# copy() creates an independent copy of a data.table.
# dplyr::mutate() creates a modified data frame result.

# Load packages and prepare the data
library(tidyverse)
library(dplyr)
library(dslabs)
library(data.table)

data(murders)

# Convert data frame to data.table
murders <- setDT(murders)

# Calculate murder rate using dplyr
murders <- mutate(
  murders,
  rate = total / population * 10^5
)

# Calculate murder rate using data.table
murders[, rate := total / population * 10^5]

# Subsetting in dplyr
filter(murders, rate <= 0.7)

# Subsetting in data.table
murders[rate <= 0.7]

# Combine filtering and column selection in data.table
murders[rate <= 0.7, .(state, rate)]

# Combine filtering and column selection in dplyr
murders %>%
  filter(rate <= 0.7) %>%
  select(state, rate)


