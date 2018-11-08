context("Printing Lists")

test_that("All sorts of lists are accepted", {
  mixed_list <- list(
    123,
    "abc",
    mean,
    iris,
    list(1, "more words", T))

  named_mixed_list <- list(
    numbers = 123,
    words = c("abc", "def"),
    functions = mean,
    tables = iris,
    lists = list(1, "more words", T)
    )

  expect_error(print_list(mixed_list), "Please use named lists only!")
  expect_identical(print_list(named_mixed_list), NULL)
  }
)

test_that("The correct header level is added", {
  example_list = list(num = 0)
  expect_match(print_list(example_list, 1), "# ")
  expect_match(print_list(example_list, 2), "## ")
  expect_match(print_list(example_list, 3), "### ")
  }
)
