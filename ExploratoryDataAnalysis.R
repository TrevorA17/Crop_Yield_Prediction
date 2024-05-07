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

# Calculate frequency of each category in 'Area' column
area_freq <- table(crop_data$Area)
print(area_freq)

# Calculate frequency of each category in 'Item' column
item_freq <- table(crop_data$Item)
print(item_freq)

# Summary statistics for 'area_yield' column
summary(crop_data$area_yield)

# Summary statistics for 'average_rain_fall_mm_per_year' column
summary(crop_data$average_rain_fall_mm_per_year)

# Summary statistics for 'pesticides_tonnes' column
summary(crop_data$pesticides_tonnes)

# Summary statistics for 'avg_temp' column
summary(crop_data$avg_temp)

# Define a function to calculate mode
Mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

# Calculate mean, median, and mode for numerical variables

# Mean, median, and mode for 'area_yield' column
mean_area_yield <- mean(crop_data$area_yield)
median_area_yield <- median(crop_data$area_yield)
mode_area_yield <- Mode(crop_data$area_yield)

# Mean, median, and mode for 'average_rain_fall_mm_per_year' column
mean_rainfall <- mean(crop_data$average_rain_fall_mm_per_year)
median_rainfall <- median(crop_data$average_rain_fall_mm_per_year)
mode_rainfall <- Mode(crop_data$average_rain_fall_mm_per_year)

# Mean, median, and mode for 'pesticides_tonnes' column
mean_pesticides <- mean(crop_data$pesticides_tonnes)
median_pesticides <- median(crop_data$pesticides_tonnes)
mode_pesticides <- Mode(crop_data$pesticides_tonnes)

# Mean, median, and mode for 'avg_temp' column
mean_temp <- mean(crop_data$avg_temp)
median_temp <- median(crop_data$avg_temp)
mode_temp <- Mode(crop_data$avg_temp)

# Print results
cat("Mean, Median, and Mode for 'area_yield' column:\n")
cat("Mean:", mean_area_yield, "Median:", median_area_yield, "Mode:", mode_area_yield, "\n\n")

cat("Mean, Median, and Mode for 'average_rain_fall_mm_per_year' column:\n")
cat("Mean:", mean_rainfall, "Median:", median_rainfall, "Mode:", mode_rainfall, "\n\n")

cat("Mean, Median, and Mode for 'pesticides_tonnes' column:\n")
cat("Mean:", mean_pesticides, "Median:", median_pesticides, "Mode:", mode_pesticides, "\n\n")

cat("Mean, Median, and Mode for 'avg_temp' column:\n")
cat("Mean:", mean_temp, "Median:", median_temp, "Mode:", mode_temp, "\n\n")

# Load required library for skewness and kurtosis calculation
library(e1071)

# Calculate measures of distribution for numerical variables

# Variance and standard deviation for 'area_yield' column
var_area_yield <- var(crop_data$area_yield)
sd_area_yield <- sd(crop_data$area_yield)

# Variance and standard deviation for 'average_rain_fall_mm_per_year' column
var_rainfall <- var(crop_data$average_rain_fall_mm_per_year)
sd_rainfall <- sd(crop_data$average_rain_fall_mm_per_year)

# Variance and standard deviation for 'pesticides_tonnes' column
var_pesticides <- var(crop_data$pesticides_tonnes)
sd_pesticides <- sd(crop_data$pesticides_tonnes)

# Variance and standard deviation for 'avg_temp' column
var_temp <- var(crop_data$avg_temp)
sd_temp <- sd(crop_data$avg_temp)

# Skewness and kurtosis for 'area_yield' column
skew_area_yield <- skewness(crop_data$area_yield)
kurt_area_yield <- kurtosis(crop_data$area_yield)

# Skewness and kurtosis for 'average_rain_fall_mm_per_year' column
skew_rainfall <- skewness(crop_data$average_rain_fall_mm_per_year)
kurt_rainfall <- kurtosis(crop_data$average_rain_fall_mm_per_year)

# Skewness and kurtosis for 'pesticides_tonnes' column
skew_pesticides <- skewness(crop_data$pesticides_tonnes)
kurt_pesticides <- kurtosis(crop_data$pesticides_tonnes)

# Skewness and kurtosis for 'avg_temp' column
skew_temp <- skewness(crop_data$avg_temp)
kurt_temp <- kurtosis(crop_data$avg_temp)

# Print results
cat("Measures of Distribution for 'area_yield' column:\n")
cat("Variance:", var_area_yield, "Standard Deviation:", sd_area_yield, "Skewness:", skew_area_yield, "Kurtosis:", kurt_area_yield, "\n\n")

cat("Measures of Distribution for 'average_rain_fall_mm_per_year' column:\n")
cat("Variance:", var_rainfall, "Standard Deviation:", sd_rainfall, "Skewness:", skew_rainfall, "Kurtosis:", kurt_rainfall, "\n\n")

cat("Measures of Distribution for 'pesticides_tonnes' column:\n")
cat("Variance:", var_pesticides, "Standard Deviation:", sd_pesticides, "Skewness:", skew_pesticides, "Kurtosis:", kurt_pesticides, "\n\n")

cat("Measures of Distribution for 'avg_temp' column:\n")
cat("Variance:", var_temp, "Standard Deviation:", sd_temp, "Skewness:", skew_temp, "Kurtosis:", kurt_temp, "\n\n")

# Calculate Pearson correlation coefficients between numerical variables
correlation_matrix <- cor(crop_data[, c("area_yield", "average_rain_fall_mm_per_year", "pesticides_tonnes", "avg_temp")])
print(correlation_matrix)

# Create contingency table for categorical variables 'Area' and 'Item'
contingency_table <- table(crop_data$Area, crop_data$Item)
print(contingency_table)

# Perform chi-square test of independence
chi_square_test <- chisq.test(contingency_table)
print(chi_square_test)

# Load required library for ANOVA
library(stats)

# Perform ANOVA for numerical variable 'area_yield' across different levels of 'Item' (crop type)
anova_result <- aov(area_yield ~ Item, data = crop_data)
print(summary(anova_result))

# Load required libraries for plotting
library(ggplot2)
library(gridExtra)

# Univariate plots for numerical variables

# Histogram for 'area_yield'
hist_area_yield <- ggplot(crop_data, aes(x = area_yield)) +
  geom_histogram(binwidth = 1000, fill = "skyblue", color = "black") +
  labs(title = "Histogram of Area Yield",
       x = "Area Yield",
       y = "Frequency")

# Histogram for 'average_rain_fall_mm_per_year'
hist_rainfall <- ggplot(crop_data, aes(x = average_rain_fall_mm_per_year)) +
  geom_histogram(binwidth = 50, fill = "lightgreen", color = "black") +
  labs(title = "Histogram of Average Rainfall",
       x = "Average Rainfall (mm/year)",
       y = "Frequency")

# Histogram for 'pesticides_tonnes'
hist_pesticides <- ggplot(crop_data, aes(x = pesticides_tonnes)) +
  geom_histogram(binwidth = 10, fill = "lightcoral", color = "black") +
  labs(title = "Histogram of Pesticides Usage",
       x = "Pesticides (tonnes)",
       y = "Frequency")

# Histogram for 'avg_temp'
hist_temp <- ggplot(crop_data, aes(x = avg_temp)) +
  geom_histogram(binwidth = 1, fill = "lightyellow", color = "black") +
  labs(title = "Histogram of Average Temperature",
       x = "Average Temperature (°C)",
       y = "Frequency")

# Combine histograms into a single plot grid
histogram_grid <- grid.arrange(hist_area_yield, hist_rainfall, hist_pesticides, hist_temp, ncol = 2)

# Univariate plots for categorical variables

# Bar plot for 'Area'
bar_area <- ggplot(crop_data, aes(x = Area)) +
  geom_bar(fill = "lightblue") +
  labs(title = "Bar Plot of Areas",
       x = "Area",
       y = "Count")

# Bar plot for 'Item'
bar_item <- ggplot(crop_data, aes(x = Item)) +
  geom_bar(fill = "lightgreen") +
  labs(title = "Bar Plot of Items",
       x = "Item",
       y = "Count") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels for better visibility

# Combine bar plots into a single plot grid
barplot_grid <- grid.arrange(bar_area, bar_item, ncol = 2)




