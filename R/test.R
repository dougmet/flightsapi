
#' Predict flight delays model
#'
#' @param flights_test Data frame with test data
#'
#' @return Prediction
#' @export
#' @examples
#' library(nycflights13)
#' data(flights)
#' set.seed(321)
#' ids <- sample(1:nrow(flights), size = 10000)
#' flights_train <- flights[ids,]
#' model <- train_flight_delay(flights_train)
#' flights_test <- flights[7,]
#' results <- predict_flight_delay(flights_test, model)
predict_flight_delay <- function(flights_test, model) {
  
  data_test <- flights_test %>%
    prep_features()
  
  stats::predict(model, newdata = data_test, type = 'prob')
  
  #data_test
}
