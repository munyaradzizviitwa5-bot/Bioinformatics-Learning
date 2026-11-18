# HARVARDX DATA SCIENCE: R BASICS
# My R programming practice

# --------------------------------
# SECTION 1: Basic Arithmetic
# --------------------------------

# Example 1: Addition
5 + 3

# Example 2: Multiplication
10 * 5

# Example 3: Division
100 / 4

# Example 4: Calculate a 15% tip
19.71 * 0.15

# Example 5: Calculate a 20% tip
25 * 0.20

# --------------------------------
# SECTION 2: Installing Packages
# --------------------------------

# Install only when needed
# install.packages("dslabs")
# install.packages("tidyverse")

# --------------------------------
# SECTION 3: Loading Packages
# --------------------------------

library(dslabs)
library(tidyverse)

# --------------------------------
# SECTION 4: Exploring a Dataset
# --------------------------------

# Load the murders dataset
data("murders")

# Display first six observations
head(murders)

# Examine dataset structure
str(murders)

# Display dataset dimensions
dim(murders)

# Display column names
names(murders)


# ==========================================
# SECTION 5: Data Types and Vectors Practice
# ==========================================

# Check the class of the dataset
class(murders)

# Examine the dataset structure
str(murders)

# Display the first six observations
head(murders)

# Access the population column
murders$population

# Create a population vector
pop <- murders$population

# Count entries in the vector
length(pop)

# Check vector classes
class(pop)
class(murders$state)

# Logical vectors
z <- 3 == 2
z
class(z)

# Factors and factor levels
class(murders$region)
levels(murders$region)

# Examples of basic data types

# Numeric
age <- 20
class(age)

# Character
sample_name <- "HIV-1"
class(sample_name)

# Logical
is_resistant <- TRUE
class(is_resistant)


# ==========================================
# SECTION 6: Vectors and Vector Indexing
# ==========================================

# 1. Creating numeric and character vectors
codes <- c(380, 124, 818)
country <- c("italy", "canada", "egypt")

# 2. Naming vector elements
codes <- c(italy = 380, canada = 124, egypt = 818)

# Alternative method
codes <- c(380, 124, 818)
country <- c("italy", "canada", "egypt")
names(codes) <- country

# 3. Accessing individual elements
codes[2]

# 4. Accessing multiple elements
codes[c(1, 3)]

# 5. Accessing a range of elements
codes[1:2]

# 6. Accessing elements by name
codes["canada"]

# 7. Checking vector information
length(codes)
class(codes)
names(codes)

# 8. Bioinformatics-related example
hiv_drugs <- c("Dolutegravir", "Tenofovir", "Lamivudine")

hiv_drugs[1]
hiv_drugs[2]
hiv_drugs[c(1, 3)]

length(hiv_drugs)

# 9. Explicit type conversion

# Create a numeric vector
x <- 1:5

# Convert numeric values into characters
y <- as.character(x)

# Check the converted vector
y

# Check its data type
class(y)

# Convert character numbers back to numeric
z <- as.numeric(y)

# Check the result
class(z)


# ==========================================
# Sorting, Ordering and Ranking in R
# ==========================================

# Create a numerical vector
x <- c(31, 4, 15, 92, 65)

# Arrange values from smallest to largest
sort(x)

# Find the positions that arrange x in ascending order
index <- order(x)

# Rearrange x using the positions
x[index]

# Find the rank of each value
rank(x)

# Load the murders dataset
library(dslabs)
data(murders)

# Sort total murders
sort(murders$total)

# Arrange state abbreviations by total murders
index <- order(murders$total)
murders$abb[index]

# Find the highest murder total
max(murders$total)

# Find the position of the highest murder total
i_max <- which.max(murders$total)

# Identify the state with the highest murder total
murders$state[i_max]


# ============================================================
# Vector Arithmetic in R
# HarvardX Data Science: R Basics
# ============================================================

# 1. Create a vector of heights in inches
heights <- c(65, 68, 70, 72, 67)

# 2. Convert heights from inches to centimetres
heights_cm <- heights * 2.54
heights_cm

# 3. Calculate the average height
average_height <- mean(heights)
average_height

# 4. Calculate how much each height differs from the average
height_difference <- heights - average_height
height_difference

# 5. Arithmetic operations between two vectors
vector_a <- c(10, 20, 30, 40)
vector_b <- c(2, 4, 6, 8)

# Addition
vector_a + vector_b

# Subtraction
vector_a - vector_b

# Multiplication
vector_a * vector_b

# Division
vector_a / vector_b

# 6. Calculate murder rate per 100,000 people
# The murders dataset was already loaded in the previous section.
murder_rate <- murders$total / murders$population * 100000

# Display the calculated murder rates
murder_rate

# 7. Arrange states by murder rate in decreasing order
murders$state[order(murder_rate, decreasing = TRUE)]

# ============================================================
# End of Vector Arithmetic                                                                          
# ============================================================

# ==========================================
# Logical Indexing and Combining Conditions
# ==========================================

# Load the murders dataset
library(dslabs)
data(murders)

# Calculate murder rate per 100,000 people
murder_rate <- murders$total / murders$population * 100000

# Condition 1: Identify states in the West region
west <- murders$region == "West"

# Condition 2: Identify states with murder rates <= 1
safe <- murder_rate <= 1

# Combine both conditions using AND (&)
index <- safe & west

# Display states satisfying both conditions
murders$state[index]

# Count the number of states satisfying both conditions
sum(index)

# ==========================================
# Selecting States Based on a Murder Rate
# ==========================================

# Identify states with murder rates <= 0.71
index <- murder_rate <= 0.71

# Display those states
murders$state[index]

# Count the number of qualifying states
sum(index)


# INDEXING AND SUBSETTING IN R

library(dslabs)
data(murders)

# Calculate murder rates
murder_rate <- murders$total / murders$population * 100000

# 1. Logical indexing
index <- murder_rate <= 1

# Extract states satisfying the condition
murders$state[index]

# 2. which(): Find positions where condition is TRUE
which(index)

# 3. match(): Find positions of selected states
selected_states <- c("New York", "Florida", "Texas")

index <- match(selected_states, murders$state)

# Extract matching state names and murder rates
murders$state[index]
murder_rate[index]

# 4. %in%: Check whether values exist
c("Boston", "Dakota", "Washington") %in% murders$state

# 5. &: Combine two conditions
west <- murders$region == "West"
safe <- murder_rate <= 1

index <- west & safe
murders$state[index]

# 6. Counting TRUE values
sum(index)


# ==========================================
# SECTION: BASIC DATA VISUALISATION
# HarvardX Data Science: R Basics
# ==========================================

library(dplyr)
library(dslabs)

data("murders")

# 1. Scatter plot: Population vs total murders
# Convert population into millions
x <- murders$population / 10^6
y <- murders$total

plot(x, y,
     main = "Total Murders vs Population",
     xlab = "Population (millions)",
     ylab = "Total Murders")

# 2. Histogram: Distribution of murder rates
# Calculate murders per 100,000 people
murders <- mutate(
  murders,
  rate = total / population * 100000
)

hist(murders$rate,
     main = "Distribution of Murder Rates",
     xlab = "Murders per 100,000 people")

# 3. Box plot: Murder rates by region
boxplot(rate ~ region,
        data = murders,
        main = "Murder Rates by Region",
        xlab = "Region",
        ylab = "Murders per 100,000 people")

# ==========================================
# END OF BASIC DATA VISUALISATION
# ==========================================
