context("Building Models")

test_that("improper inputs are handled properly", {
  # A valid list of formulas
  formulas <- list(f1 = Sepal.Length ~ Sepal.Width, f2 = Sepal.Length ~ Petal.Length)

  # Missing inputs
  expect_error(
    build_model_objects(),
    "Please provide a list of formulas and a dataset"
  )
  expect_error(
    build_model_objects(formulas),
    "Please provide a list of formulas and a dataset"
  )
  expect_error(
    build_model_objects(data = iris),
    "Please provide a list of formulas and a dataset"
  )

  # Invalid inputs
  expect_error(
    build_model_objects(1, iris),
    "You didn't enter a valid list of formulas"
  )
  expect_error(
    build_model_objects("a", iris),
    "You didn't enter a valid list of formulas"
  )
  expect_error(
    build_model_objects(list(1, "a", TRUE) , iris),
    "You didn't enter a valid list of formulas"
  )

  # Formulas / dataset mismatch
  expect_error(
    build_model_objects(formulas, mtcars),
    "One or more of the formulas, dataset, and model are incompatible. Please double check that:\n
            - there are no typos in the formula
            - the correct dataset was provided
            - the model function returns a model object
            - the package with the model was loaded
            - all the mandatory arguments are provided for the model"
  )
})

test_that("proper models are built", {
  # A valid list of formulas
  formulas <- list(f1 = Sepal.Length ~ Sepal.Width)

  # linear model
  expect_equal(
    coef(build_model_objects(formulas, iris)[[1]]),
    coef(lm(formulas[[1]], data = iris))
  )
  # generalized linear model
  expect_equal(
    coef(build_model_objects(formulas, iris, glm, family = quasipoisson)[[1]]),
    coef(glm(formulas[[1]], data = iris, family = quasipoisson))
  )
})
