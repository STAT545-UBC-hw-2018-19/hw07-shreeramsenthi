#' @title Return a tidy tibble of AIC information given a list of model objects
#' @param models List of model objects
#' @return Tibble of AIC summary stats
#' @export

summarize_aic <- function(models){
  # Code wrapped in check_models to test for invalid input
  check_models(
    tibble::tibble(
      model = names(models),
      aic = purrr::map_dbl(models, stats::AIC),
      delta_aic = aic - min(aic),
      likelihood = exp(-0.5 * delta_aic),
      aic_weight = likelihood / sum(likelihood)
      )
  )
}
