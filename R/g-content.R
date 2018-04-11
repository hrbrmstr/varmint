#' Retrieve the content portion of a gopher response
#'
#' @md
#' @param res gopher response object
#' @param has_selector if `TRUE`, only gopher menu entries with populated
#'        selectors (site resource links, URLs, etc) will be returned.
#'        Default: `FALSE`
#' @export
#' @examples
#' gopher("gopher.floodgap.com/") %>%
#'   g_content()
g_content <- function(res, has_selector = FALSE) {

  stopifnot(inherits(res, "gopher_response"))

  saf <- unlist(getOption("stringsAsFactors", default = FALSE), use.names = FALSE)
  on.exit(options("stringsAsFactors" = saf), add = TRUE)
  options("stringsAsFactors" = FALSE)

  readBin(res$content, character()) %>%
    strsplit("\n") %>%
    unlist() %>%
    trimws() %>%
    strsplit("\t") %>%
    lapply(as.list) %>%
    lapply(`[`, 1:4) %>%
    lapply(setNames, c("display_string", "selector", "hostname", "port")) %>%
    Filter(function(x) is_not_null(x[[2]]), .) %>%
    do.call(rbind.data.frame, .) -> gdf

  gdf$item_type <- substr(gdf$display_string, 1, 1)
  gdf$item_type_descr <- item_type[gdf$item_type]
  gdf$display_string <- sub("^.", "", gdf$display_string)

  gdf$selector <- ifelse(gdf$selector == "", NA_character_, gdf$selector)

  gdf <- gdf[,c("item_type", "item_type_descr", "display_string", "selector", "hostname", "port")]

  class(gdf) <- c("tbl_df", "tbl", "data.frame")

  if (has_selector) gdf[!is.na(gdf$selector),] else gdf

}