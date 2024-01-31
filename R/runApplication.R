#' Run the CorEvitas "Registry Data Quality Checks Report"
#'
#' @param outputUrl A text url string to the location of the registry check output datasets
#'
#' @export
runApplication <- function(outputUrl){

  .GlobalEnv$.outputUrl = outputUrl

  appDir <- system.file("myapp", package = "registrydqchecksreport")
  if (appDir == "") {
    stop("Could not find myapp. Try re-installing `registrydqchecksreport`.", call. = FALSE)
  }

  # shiny::runApp(appDir, display.mode = "auto")
  shiny::runGadget(appDir, viewer = paneViewer(width = 1200))
}
