# Load dataset
crop_data <- read.csv("data/yield_df.csv", colClasses = c(
  id = "integer",
  Area = "factor",
  Item = "factor",
  Year = "integer",
  area_yield = "integer",
  average_rain_fall_mm_per_year = "integer",
  pesticides_tonnes = "numeric",
  avg_temp = "numeric"
))

# Display the structure of the dataset
str(crop_data)

# View the first few rows of the dataset
head(crop_data)

# View the dataset in a separate viewer window
View(crop_data)

# Load required library for data splitting
library(caret)

# Set seed for reproducibility
set.seed(123)

# Define the proportion of data to be used for training (e.g., 80%)
train_proportion <- 0.8

# Perform data splitting
train_index <- createDataPartition(crop_data$area_yield, p = train_proportion, list = FALSE)
train_data <- crop_data[train_index, ]
test_data <- crop_data[-train_index, ]

# Check the dimensions of the training and testing sets
cat("Training data dimensions:", dim(train_data), "\n")
cat("Testing data dimensions:", dim(test_data), "\n")
