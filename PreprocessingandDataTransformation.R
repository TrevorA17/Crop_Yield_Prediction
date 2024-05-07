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
