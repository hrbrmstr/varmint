#' S3 print method for gopher response objects
#'
#' @param x gopher response object
#' @param ... unused
#' @export
print.gopher_response <- function(x, ...) {

  stopifnot(inherits(x, "gopher_response"))

  out <- g_content(x)

  for (i in 1:nrow(out)) {

    r <- out[i,]

    itype <- if (r$item_type == "i") "" else sprintf("(%s)", r$item_type_descr)

    switch(
      r$item_type,
      '0' = crayon::yellow(r$display_string),
      '1' = crayon::green(r$display_string),
      r$display_string
    ) -> ds

    cat(
      sprintf("%12s %s\n", itype, ds),
      sep = ""
    )

  }

  invisible(x)

}