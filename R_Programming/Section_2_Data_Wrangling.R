
# ============================================================
# HarvardX: Data Science - R Basics
# Section 2: Data Wrangling
# Bioinformatics Learning Portfolio
# ============================================================

# ============================================================
# PART 1: HEIGHTS DATASET
# ============================================================

# Load required package
library(dplyr)

# Load the heights dataset
data("heights")

# Display the first six observations
head(heights)

# Inspect dataset structure
str(heights)

# ------------------------------------------------------------
# 1. FINDING MINIMUM AND MAXIMUM HEIGHTS
# ------------------------------------------------------------

# Find minimum height
min_height <- min(heights$height)
min_height

# Find maximum height
max_height <- max(heights$height)
max_height

# ------------------------------------------------------------
# 2. CREATING A SEQUENCE OF INTEGERS
# ------------------------------------------------------------

# Define the minimum and maximum boundaries
start <- min(heights$height)
end <- max(heights$height)

# Generate integers between the boundaries
x <- ceiling(start):floor(end)

# Display the sequence
x

# ------------------------------------------------------------
# 3. IDENTIFYING VALUES NOT PRESENT IN THE DATASET
# ------------------------------------------------------------

# Count integers in x that are absent from the height column
sum(!(x %in% heights$height))

# ------------------------------------------------------------
# 4. CONVERTING HEIGHTS FROM INCHES TO CENTIMETRES
# ------------------------------------------------------------

# Create a new dataset with height in centimetres
heights2 <- mutate(heights, ht_cm = height * 2.54)

# Display the updated dataset
head(heights2)

# ------------------------------------------------------------
# 5. RETRIEVING THE 18TH INDIVIDUAL'S HEIGHT
# ------------------------------------------------------------

# Retrieve height in centimetres for individual 18
heights2$ht_cm[18]

# ------------------------------------------------------------
# 6. CALCULATING MEAN HEIGHT IN CENTIMETRES
# ------------------------------------------------------------

# Mean height of the entire dataset
mean(heights2$ht_cm)

# ------------------------------------------------------------
# 7. FILTERING FEMALE INDIVIDUALS
# ------------------------------------------------------------

# Select female individuals
females <- filter(heights2, sex == "Female")

# Count the number of female individuals
nrow(females)

# ------------------------------------------------------------
# 8. CALCULATING MEAN FEMALE HEIGHT
# ------------------------------------------------------------

# Mean height of female individuals in centimetres
mean(females$ht_cm)

# ============================================================
# PART 2: MURDERS DATASET
# ============================================================

# Load the murders dataset
data("murders")

# Inspect the dataset
head(murders)

# ------------------------------------------------------------
# 9. FINDING THE INDEX OF MASSACHUSETTS
# ------------------------------------------------------------

# Using which()
which(murders$state == "Massachusetts")

# Using match()
match("Massachusetts", murders$state)

# ------------------------------------------------------------
# 10. FILTERING THE NORTHEAST REGION
# ------------------------------------------------------------

# Using filter()
filter(murders, region == "Northeast")

# Using the pipe operator
murders %>%
  filter(region == "Northeast")

# ------------------------------------------------------------
# 11. CHECKING WHETHER VALUES ARE ABSENT FROM A VECTOR
# ------------------------------------------------------------

# Example vector of state names
ind <- c("California", "Massachusetts", "Zimbabwe")

# Identify values not present in murders$state
!ind %in% murders$state

# Count values absent from murders$state
sum(!ind %in% murders$state)

# ============================================================
# END OF SECTION 2: DATA WRANGLING
# ============================================================