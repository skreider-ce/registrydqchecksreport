#' Run the CorEvitas "Registry Data Quality Checks Report"
#'
#' @param outputUrl A text url string to the location of the registry check output datasets
#'
#' @export
runApplication <- function(.outputUrl){

  # Set global .outputUrl variable for use in server code
  .GlobalEnv$.outpUrl = .outputUrl

  # Set application directory for the app to be run
  appDir <- system.file("myapp", package = "registrydqchecksreport")
  if (appDir == "") {
    stop("Could not find myapp. Try re-installing `registrydqchecksreport`.", call. = FALSE)
  }

  # Run the shiny application
  shiny::runApp(appDir, display.mode = "auto")
}
