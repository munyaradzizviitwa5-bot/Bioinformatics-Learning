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