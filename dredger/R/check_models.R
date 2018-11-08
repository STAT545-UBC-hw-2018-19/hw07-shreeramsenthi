#' @title Run code and intercept errors due to invalid inputs
#' @param code Function to be checked
#' @return The output of code, if ran successfully

check_models <- function(code){
  tryCatch(
    result <- code,
    error = function(e)
      stop("Something went wrong! Are you sure you provided a list of valid model objects?")
  )

  return(result)
}
