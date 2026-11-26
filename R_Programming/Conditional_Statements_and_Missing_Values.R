
# ============================================================
# HarvardX Data Science: R Basics
# Topic: Conditional Statements and Missing Values
# Repository: Bioinformatics-Learning
#
# Description:
# Practice with if-else statements, ifelse(), logical
# conditions, reciprocals, and handling missing values.
# ============================================================

# ------------------------------------------------------------
# 1. IF-ELSE STATEMENT
# ------------------------------------------------------------

# An if-else statement executes different code depending
# on whether a condition is TRUE or FALSE.

a <- 0

if (a != 0) {
  print(1 / a)
} else {
  print("No reciprocal for 0.")
}

# ------------------------------------------------------------
# 2. FINDING THE STATE WITH THE LOWEST MURDER RATE
# ------------------------------------------------------------

# Load the dslabs package and murders dataset.

library(dslabs)
data(murders)

# Calculate murder rates per 100,000 people.

murder_rate <- murders$total / murders$population * 100000

# Find the position of the smallest murder rate.

ind <- which.min(murder_rate)

# Check whether the lowest murder rate is below 0.5.

if (murder_rate[ind] < 0.5) {
  print(murders$state[ind])
} else {
  print("No state has murder rate that low.")
}

# ------------------------------------------------------------
# 3. CHANGING THE CONDITIONAL THRESHOLD
# ------------------------------------------------------------

# Changing the threshold can change the result.

if (murder_rate[ind] < 0.25) {
  print(murders$state[ind])
} else {
  print("No state has murder rate that low.")
}

# ------------------------------------------------------------
# 4. THE IFELSE() FUNCTION
# ------------------------------------------------------------

# ifelse() returns one value when a condition is TRUE
# and another when it is FALSE.

a <- 0

ifelse(a > 0, 1 / a, NA)

# ------------------------------------------------------------
# 5. APPLYING IFELSE() TO A VECTOR
# ------------------------------------------------------------

# Calculate reciprocals only for positive numbers.
# Return NA for zero and negative numbers.

a <- c(0, 1, 2, -4, 5)

result <- ifelse(a > 0, 1 / a, NA)

print(result)

# Expected result:
# NA 1.0 0.5 NA 0.2

# ------------------------------------------------------------
# 6. IDENTIFYING AND REPLACING MISSING VALUES
# ------------------------------------------------------------

# Load the example dataset containing missing values.

data(na_example)

# Count the missing values.

sum(is.na(na_example))

# Replace missing values with zero.

no_nas <- ifelse(is.na(na_example), 0, na_example)

# Check how many missing values remain.

sum(is.na(no_nas))

# ------------------------------------------------------------
# 7. THE ANY() AND ALL() FUNCTIONS
# ------------------------------------------------------------

# Create a logical vector.

z <- c(TRUE, TRUE, FALSE)

# any() checks whether at least one value is TRUE.

any(z)

# all() checks whether every value is TRUE.

all(z)

# ============================================================
# END OF PRACTICE SCRIPT
# ============================================================