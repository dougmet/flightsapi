
# Create a holiday feature for New York dates
#
# @param date A vector of dates on which to check holidays
#
# @return
isHoliday <- function(date) {


  years <- lubridate::year(date)
  
  x <- timeDate::isHoliday(as.timeDate(date),
                           holidayNYSE(unique(years)),
                           wday=0:6)

  x

}
