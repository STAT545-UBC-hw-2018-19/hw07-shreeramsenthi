# Stat547 Assignment 2: Package Development

This is my submission for assignment 2 of the 2018 iteration of the Stat547 course at UBC.

In the last assignment in Stat545 we explored uses of the `purr` package to more efficiently wrangle data. In this assignment we will be developing packages with help from the `devtools` and `testthat` packages.

Specifically, we were tasked with adding functionality and testing to the `powers` package. However, for the last assignment, I wound up breaking from the suggested tasks and built a bunch of functions that I thought would be useful to expedite multiple hypothesis testing for exploratory analysis. Since I've already got that set up, I thought I would make a package of that instead. Please see the [previous assignment](https://github.com/STAT545-UBC-students/hw06-shreeramsenthi/blob/master/purrr-exercise.md) for details on the functions I will be packaging and testing here.

If you have the `devtools` package installed in R, you can install this package by running the following command in R:
```
devtools::install_github("STAT545-UBC-students/hw07-shreeramsenthi")
```

If you don't feel like installing the package but still want to see what it's all about, please check out the [markdown version of the vignette](https://github.com/STAT545-UBC-students/hw07-shreeramsenthi/blob/master/vignettes/dredger.md) I've included here for a walkthrough of the included functions.

Thanks for checking this project out!
