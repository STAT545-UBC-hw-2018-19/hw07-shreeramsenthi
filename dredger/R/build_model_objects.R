#' @title Build list of model objects
#' @param formulas List of model formulas
#' @param data Dataframe with variables corresponding to the components of `formulas`
#' @param model Function that generates model objects from formulas
#' @param ... args to be passed to `model`
#' @return A list of model objects
#' @export

build_model_objects <- function(formulas, data, model = stats::lm, ...){
  # Check that both the arguments without defaults were provided
  if(missing(formulas) | missing(data))
    stop("Please provide a list of formulas and a dataset")

  # Check that every element of the formula list is a valid formula
  if(!all(purrr::map_chr(formulas, class) == "formula"))
    stop("You didn't enter a valid list of formulas.")

  # Check for other problems with tryCatch
  result <- tryCatch(
    purrr::map(formulas, model, ..., data = data),# Create and return the list of model objects
    error = function(e){ # Return an error if one or more models cannot be constructed
      print(e) # Print the specific error as well as some general suggestions:
      stop("One or more of the formulas, dataset, and model are incompatible. Please double check that:\n
            - there are no typos in the formula
            - the correct dataset was provided
            - the model function returns a model object
            - the package with the model was loaded
            - all the mandatory arguments are provided for the model")
    }
  )

  # Return the list of model objects
  return(result)
}
