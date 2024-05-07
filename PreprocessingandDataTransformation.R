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

# Check for missing values in the dataset
missing_values <- any(is.na(crop_data))
print(missing_values)

# Load required library for data transformation
library(dplyr)

# Check the distribution of numerical variables before transformation
summary(crop_data[, c("area_yield", "average_rain_fall_mm_per_year", "pesticides_tonnes", "avg_temp")])

# Perform log transformation on skewed numerical variables
crop_data_transformed <- crop_data %>%
  mutate(
    area_yield_log = log(area_yield + 1),  # Adding 1 to handle zero values
    average_rain_fall_mm_per_year_log = log(average_rain_fall_mm_per_year + 1),
    pesticides_tonnes_log = log(pesticides_tonnes + 1),
    avg_temp_log = log(avg_temp + 1)
  )

# Check the distribution of transformed numerical variables
summary(crop_data_transformed[, c("area_yield_log", "average_rain_fall_mm_per_year_log", "pesticides_tonnes_log", "avg_temp_log")])
