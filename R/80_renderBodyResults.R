#' (internal function) Render the check results in the body of the UI
#'
#' @param .output The shiny app server output object
#' @param .criticalCheckList List of the critical checks to render
#' @param .ccSummary The critical check summary list
#' @param .ncSummary The noncritical check summary list
#' @param .nonCriticalCheckList List of the noncritical checks to render
#'
#' @export
renderBodyResults <- function(.output,.ccSummary,.ncSummary,.criticalCheckList,.nonCriticalCheckList){
  renderSummaryResults(.output = .output
                       ,.ccSummary = .ccSummary
                       ,.ncSummary = .ncSummary)
  renderCheckDetailResults(.output = .output
                           ,.criticalCheckList = .criticalCheckList
                           ,.nonCriticalCheckList = .nonCriticalCheckList)
}

#' (internal function) Render the results of the critical checks to the ui
#'
#' @param .criticalCheckList List of the critical checks to render
#' @param .nonCriticalCheckList List of the noncritical checks to render
#' @param .output The shiny app server output object
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
