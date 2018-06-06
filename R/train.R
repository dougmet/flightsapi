
#' Train the flights model
#'
#' @param flights_train Flights training data frame
#'
#' @return model
#' @export
#' @import dplyr
#'
#' @examples 
#' set.seed(123)
#' ids <- sample(1:nrow(flights), size = 10000)
#' flights_train <- flights[ids,]
#' model <- train_flight_delay(flights_train)
train_flight_delay <- function(flights_train) {
  
  data_train <- flights_train %>%
    prep_target() %>%
    prep_features() %>%
    tidyr::drop_na()
  
  
  model <- randomForest::randomForest(isLate ~ holiday +
                                        week_day + 
                                        sched_dep_time +
                                        origin + 
                                  #      carrier + 
                                        distance,
                                      data = data_train)
}
