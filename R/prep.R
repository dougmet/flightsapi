#' Prepare Features
#'
#' @param flights_data flights data frame
#'
#' @return data frame with features added
#' @import dplyr
#' 
prep_features <- function(flights_data) {
  flights_data %>%
    mutate(
      date = as.Date(paste(year, month, day, sep = "-")),
      holiday = isHoliday(date),
      week_day = factor(
        weekdays(date),
        levels = c(
          "Monday",
          "Tuesday",
          "Wednesday",
          "Thursday",
          "Friday",
          "Saturday",
          "Sunday"
        )
      )
    ) %>%
    mutate(carrier = factor(carrier),
           origin = factor(origin))
  
}

#' Prepare Target
#'
#' @param flights_data flights data frame
#'
#' @return data frame with target added
#' @import dplyr
prep_target <- function(flights_data) {
  flights_data %>%
    mutate(isLate = dep_delay > 15) %>%
    mutate(isLate = factor(tolower(isLate)))
}
