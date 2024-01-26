#' (internal function) Extracts the critical check pass/fail results for a specific registrydqchecks dataset output
#'
#' @param .resultsList A list of the results in the specific format from registrydqchecks
#'
#' @returns A list of the results of the critical check pass/fail results for the specific registrydqchecks dataset output
#'
#' @export
extractPassFail <- function(.resultsList){

  .passFailList <- data.frame()

  for(.result in .resultsList){
    .passFailList <- append(.passFailList, {names(.result) = .result$pass})
  }

  names(.passFailList) <- names(.resultsList)

  return(.passFailList)
}


#' (internal function) Extract pass/fail results from all the datasets for this datapull
#'
#' @param .dsList A list containing the registrydqchecks output for all datasets for this datapull date
#'
#' @returns A list of the pass/fail results for all critical checks for all datasets
#'
#' @export
extractPassFailUpper <- function(.dsList){

  .passFailList2 <- c()
  .pfList <- list()

  for(.dsName in names(.dsList)){
    for(.result in names(.dsList[[.dsName]])){
      .passFailList2 <- c(.passFailList2, .dsList[[.dsName]][[.result]]$pass)
    }
  }

  return(.passFailList2)
}
