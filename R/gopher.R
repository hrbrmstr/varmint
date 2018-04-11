#' Fetch a resource using the gopher protocol
#'
#' @md
#' @param url gopher url (with or without the `gopher://` prefix)
#' @param path optional selector path; this can be part of the `url` vs a separate
#'        parameter but this helps avoid having to `sprintf()` or `paste0()`
#'        values in client code.
#' @param query character string containing the search terms/phrase to pass to
#'        a gopher search engine (i.e. a 'veronica' endpoint).
#' @param verbose if `TRUE` debugging output will be shown; Default: `FALSE`
#' @export
#' @examples
#' gopher("gopher://gopher.floodgap.com:70/")
#' gopher("gopher://gopher.floodgap.com/")
#' gopher("gopher.floodgap.com/") %>%
#'   g_content()
gopher <- function(url, path = NULL, query = NULL, verbose = FALSE) {

  stopifnot(length(url) == 1)

  # handle no terminating '/' for gopher host
  if (!grepl('/', sub("gopher://", "", url))) url <- sprintf("%s/", url)

  # handle missing 'gopher://' prefix
  if (!grepl("^gopher://", url)) url <- sprintf("gopher://%s", url)

  # did the caller specify a path separately?
  if (!is.null(path)) url <- sprintf("%s%s", url, path)

  # gopher search parameter queries have to be preceded by a tab
  if (!is.null(query)) url <- sprintf("%s\t%s", url, query)

  # tabs must be encoded with '%09'
  url <- gsub("\t", "%09", url)

  # do this to get the hostname
  url_bits <- urltools::url_parse(url)

  # so we can get the IP address
  ip <- curl::nslookup(url_bits$domain[1])

  h <- curl::new_handle()

  if (verbose) {
    cat(crayon::yellow(sprintf("> Fetching [%s]...\n", url)))
    curl::handle_setopt(h, .list = list(verbose = TRUE))
  }

  res <- curl::curl_fetch_memory(url, h)
  res$ip <- ip

  class(res) <- c("gopher_response")

  res

}

