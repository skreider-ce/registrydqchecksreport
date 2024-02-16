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
    if(!is.null(.result)){
      .passFailList <- append(.passFailList, {names(.result) = .result$pass})
    } else{
      .passFailList <- append(.passFailList, NULL)
    }

  }

  return(.passFailList)
}
