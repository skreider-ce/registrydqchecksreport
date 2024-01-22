#' @export
runApplication <- function(){
  appDir <- system.file("myapp", package = "regdqchecks")
  if (appDir == "") {
    stop("Could not find myapp. Try re-installing `regdqchecks`.", call. = FALSE)
  }

  shiny::runApp(appDir, display.mode = "normal", params = list(url = staticFolderUrl))
}
