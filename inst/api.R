library(flightsapi)

#* @get /now
nowTime <- function(){
  lubridate::now()
}

flights_model <- readRDS(system.file("model.rds", package = "flightsapi"))

# Call the longestRun function
#
#* @post /flightdelay
flightdelay <- function(flight) {
  flights_test <- as.data.frame(flight)
  pred = predict_flight_delay(flights_test, model = flights_model)
  
  response = list(api_version = 0.1, prediction = pred)
  
  response
}
