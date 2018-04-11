#' Valid single character item types
#'
#' @docType data
#' @export
#' @examples
#' names(item_type)
#' item_type["I"]
stats::setNames(
  c(
    "text", "menu", "cso", "error", "macbinhex", "pcbinary", "uuencoded",
    "index", "telnet", "binary", "gif", "html", "chtml", "sound", "www",
    "image", "tn3270", "info", "duplicate", "plus_image", "plus_movie",
    "plus_sound", "plus_pdf"
  ),
  c(
    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'g', 'h', 'H', 's', 'w',
    'I', 'T', 'i', '+', ':', ';', '<', 'P'
  )
) -> item_type
