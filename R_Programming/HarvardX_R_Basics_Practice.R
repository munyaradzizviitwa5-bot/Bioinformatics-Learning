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

