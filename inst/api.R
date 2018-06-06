
#* @get /now
nowTime <- function(){
  lubridate::now()
}

# Call the longestRun function
#
#* @get /longrun
#* @post /longrun
longrun <- function(start = Sys.Date(), end = Sys.Date() + 370, daysleave = 10) {
  daysleave <- as.integer(daysleave)
  flightsapi::longestRun(startDate = start, endDate = end, daysLeave = daysleave)
}

#* @get /minleave
#* @post /minleave
minleave <- function(start = Sys.Date(), end = Sys.Date() + 370, window = 21) {
  window <- as.integer(window)
  flightsapi::minDaysLeave(startDate = start, endDate = end, window = window)
}
