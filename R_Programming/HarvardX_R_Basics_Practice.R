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

