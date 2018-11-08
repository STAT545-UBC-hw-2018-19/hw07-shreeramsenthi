#' @title Print a named list using markdown-style header tags
#' @param list_to_print List of objects to print
#' @param level Markdown header level

print_list <- function(list_to_print, level = 4){
  # Make a header of the appropriate length
  header <- stringr::str_pad(" ", level+1, "left", "#")

  # Iterate through the list and print
  purrr::map2(list_to_print, names(list_to_print), function(x, name){
    cat(header)
    cat(name)
    print(x)
    cat("\n")
    }
  )

  # Don't return anything
  invisible()
}
