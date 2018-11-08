#' @title Build a single tibble of predictions from a list of models
#' @param models List of model objects
#' @return Tibble of fitted predictions
#' @export

tidy_predictions <- function(models){
  # Code wrapped in check_models to check for bad inputs
  check_models(
    models %>%
      purrr::map(broom::augment) %>%
      purrr::map2(names(.), ~ dplyr::mutate(.x, model_name = .y)) %>%
      dplyr::bind_rows()
  )
}
