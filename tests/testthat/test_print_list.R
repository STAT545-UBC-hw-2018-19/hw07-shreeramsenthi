context("Printing Lists")

test_that("only named lists are accepted.", {
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
