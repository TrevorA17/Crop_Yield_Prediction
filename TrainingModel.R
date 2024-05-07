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
train_index <- createDataPartition(crop_data_transformed$area_yield, p = train_proportion, list = FALSE)
train_data <- crop_data_transformed[train_index, ]
test_data <- crop_data_transformed[-train_index, ]

# Check the dimensions of the training and testing sets
cat("Training data dimensions:", dim(train_data), "\n")
cat("Testing data dimensions:", dim(test_data), "\n")

# Load required library for bootstrapping
library(boot)

# Define the function to calculate the statistic of interest (e.g., mean)
# For example, let's calculate the mean of 'area_yield'
boot_mean <- function(data, indices) {
  mean(data[indices, "area_yield"])
}

# Set the number of bootstrap samples
num_bootstrap_samples <- 1000

# Perform bootstrapping
boot_results <- boot(crop_data_transformed, boot_mean, R = num_bootstrap_samples)

# Display the results
print(boot_results)

# Load required libraries for cross-validation
library(caret)

# Define the training control parameters
train_control <- trainControl(method = "cv",   # "cv" for k-fold cross-validation
                              number = 10)     # Number of folds (e.g., 10-fold cross-validation)

# Define the model training process (e.g., linear regression)
model <- train(area_yield ~ .,                     # Formula for the model
               data = crop_data_transformed,       # Dataset
               method = "lm",                      # Method (e.g., linear regression)
               trControl = train_control)          # Training control parameters

# Print the cross-validation results
print(model)

# Load required libraries for modeling
library(caret)
library(e1071)  # Required for SVM

# Train linear regression model
lm_model <- train(area_yield ~ .,                     # Formula for the model
                  data = crop_data_transformed,       # Dataset
                  method = "lm",                      # Method (linear regression)
                  trControl = trainControl(method = "cv", number = 10))  # Training control parameters

# Print the linear regression model results
print(lm_model)

# Train decision tree model
rpart_model <- train(area_yield ~ .,                     # Formula for the model
                     data = crop_data_transformed,       # Dataset
                     method = "rpart",                   # Method (decision trees)
                     trControl = trainControl(method = "cv", number = 10))  # Training control parameters

# Print the decision tree model results
print(rpart_model)
