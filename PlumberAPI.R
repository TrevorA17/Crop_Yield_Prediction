# Load the saved GBM model
loaded_gbm_model <- readRDS("./models/saved_gbm_model.rds")

#* @apiTitle Crop Yield Prediction Model API
#* @apiDescription Used to predict crop yields.

#* @param Area Name of the area where the crop is grown
#* @param Item Type of crop
#* @param Year Year of observation
#* @param average_rain_fall_mm_per_year Average rainfall in mm per year
#* @param pesticides_tonnes Amount of pesticides used in tonnes
#* @param avg_temp Average temperature during the year
#* @param area_yield_log Transformed area_yield (log scale)
#* @param average_rain_fall_mm_per_year_log Transformed average_rain_fall_mm_per_year (log scale)
#* @param pesticides_tonnes_log Transformed pesticides_tonnes (log scale)
#* @param avg_temp_log Transformed avg_temp (log scale)

#* @get /crop_yield_prediction

predict_crop_yield <- function(Area, Item, Year, 
                               average_rain_fall_mm_per_year, pesticides_tonnes, avg_temp,
                               area_yield_log, average_rain_fall_mm_per_year_log, 
                               pesticides_tonnes_log, avg_temp_log) {
  
  # Create a data frame using the arguments
  to_be_predicted <- data.frame(
    Area = as.character(Area),
    Item = as.character(Item),
    Year = as.integer(Year),
    average_rain_fall_mm_per_year = as.numeric(average_rain_fall_mm_per_year),
    pesticides_tonnes = as.numeric(pesticides_tonnes),
    avg_temp = as.numeric(avg_temp),
    area_yield_log = as.numeric(area_yield_log),
    average_rain_fall_mm_per_year_log = as.numeric(average_rain_fall_mm_per_year_log),
    pesticides_tonnes_log = as.numeric(pesticides_tonnes_log),
    avg_temp_log = as.numeric(avg_temp_log)
  )
  
  # Use the loaded model to make predictions
  prediction <- predict(loaded_gbm_model, newdata = to_be_predicted)
  
  # Return the prediction
  return(prediction)
}

