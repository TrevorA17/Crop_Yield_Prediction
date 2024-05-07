# Saving the GBM model
saveRDS(gbm_model, "./models/saved_gbm_model.rds")

# Load the saved model
loaded_gbm_model <- readRDS("./models/saved_gbm_model.rds")

# Prepare new data for prediction
new_data <- data.frame(
  Area = "Albania",
  Item = "Maize",
  Year = 1990,
  average_rain_fall_mm_per_year = 1485,
  pesticides_tonnes = 121,
  avg_temp = 16.37,
  area_yield_log = log(36613 + 1),  # Apply the same transformation as during model training
  average_rain_fall_mm_per_year_log = log(1485 + 1),  # Apply the same transformation as during model training
  pesticides_tonnes_log = log(121 + 1),  # Apply the same transformation as during model training
  avg_temp_log = log(16.37 + 1)  # Apply the same transformation as during model training
)

# Use the loaded model to make predictions
predictions_loaded_model <- predict(loaded_gbm_model, newdata = new_data)

# Print predictions
print(predictions_loaded_model)
