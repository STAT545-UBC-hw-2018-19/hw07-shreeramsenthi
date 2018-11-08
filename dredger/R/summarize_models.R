#' @title Print tidied tables of model summary stats
#' @param models List of model objects
#' @param ... args to be passed to `Anova`
#' @export

summarize_models <- function(models, ...){
  # Wrap code in `check_models` to check for bad inputs
  check_models({
    # Print out a nice table of anova outputs
    cat("### Anova tables: \n")
    models %>%
      purrr::map(car::Anova, ...) %>%
      purrr::map(broom::tidy) %>%
      purrr::map(dplyr::mutate_if, # Use mutate_if to convert numerics to scientific notation as needed
        is.numeric,
        function(x) as.character(signif(x, 3))) %>%
      purrr::map(knitr::kable) %>%
      print_list

    # Print out a nice table of confidence intervals
    cat("### Confidence Intervals for Coefficients: \n")
    models %>%
      purrr::map(confint) %>%
      purrr::map(tibble::as_tibble) %>%
      purrr::map(dplyr::mutate_if, # as before
        is.numeric,
        function(x) as.character(signif(x, 3))) %>%
      purrr::map(knitr::kable) %>%
      print_list
  })

  # Don't return anything at the end
  invisible()
}
