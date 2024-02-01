
#' Return runner summary information to print to the screen
#'
#' @param .selectedPullInfo The name of the pull dataset and timestamp of the pull
#'
#' @return A summary of the person who ran the checks
#' @export
extractRunnerSummary <- function(.selectedPullInfo){
  .dataTimestamp <- substr(.selectedPullInfo, 12, 30)
  print(glue::glue("{.outputUrl}/summary/runnerSummary_{.dataTimestamp}.rds"))
  .runnerSummary <- readRDS(glue::glue("{.outputUrl}/summary/runnerSummary_{.dataTimestamp}.rds"))

  return(.runnerSummary)
}
