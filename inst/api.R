library(flightsapi)
library(randomForest)

#' @get /now
nowTime <- function(){
  lubridate::now()
}

# This could point to an external location
Sys.setenv(MODEL_LOCATION=system.file("model.rds", package = "flightsapi"))

flights_model <- readRDS(Sys.getenv("MODEL_LOCATION"))

# Call the longestRun function
#
#' @post /flightdelay
#' @serializer unboxedJSON
#' @param flight A data frame (json records) with columns, year, month, day, sched_dep_time, carrier, origin, distance
flightdelay <- function(flight) {
  flights_test <- as.data.frame(flight)
  pred = predict_flight_delay(flights_test, model = flights_model)
  
  response = list(api_version = 0.1, prediction = pred)
  
  response
}
