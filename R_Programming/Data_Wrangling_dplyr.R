
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
