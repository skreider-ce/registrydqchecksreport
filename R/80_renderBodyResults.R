#' (internal function) Render the check results in the body of the UI
#'
#' @param .output The shiny app server output object
#' @param .summary The summary object to be rendered to the ui
#' @param .checkList The list of check results to be rendered to the ui
#'
#' @export
renderBodyResults <- function(.output,.summary,.criticalCheckList,.nonCriticalCheckList){
  renderSummaryResults(.output = .output
                       ,.summary = .summary)
  renderCheckDetailResults(.output = .output
                           ,.criticalCheckList = .criticalCheckList
                           ,.nonCriticalCheckList = .nonCriticalCheckList)
}

#' (internal function) Render the results of the critical checks to the ui
#'
#' @param .output The shiny app server output object
#' @param .checkList A list of the results of the critical checks
#'
#' @export
renderCheckDetailResults <- function(.output,.criticalCheckList,.nonCriticalCheckList){
  renderCritCheck1(.output, .criticalCheckList[["criticalCheck1"]])
  renderCritCheck2(.output, .criticalCheckList[["criticalCheck2"]])
  renderCritCheck3(.output, .criticalCheckList[["criticalCheck3"]])
  renderCritCheck4(.output, .criticalCheckList[["criticalCheck4"]])
  renderCritCheck5(.output, .criticalCheckList[["criticalCheck5"]])
  renderCritCheck6(.output, .criticalCheckList[["criticalCheck6"]])
  renderCritCheck7(.output, .criticalCheckList[["criticalCheck7"]])
  renderCritCheck8(.output, .criticalCheckList[["criticalCheck8"]])
  renderNonCriticalCheckOuput(.output = .output
                              ,.resultsToRender = .nonCriticalCheckList)
}
