#' (internal function) Render the check results in the body of the UI
#'
#' @param .output The shiny app server output object
#' @param .summary The summary object to be rendered to the ui
#' @param .checkList The list of check results to be rendered to the ui
#'
#' @export
renderBodyResults <- function(.output,.summary,.checkList){
  renderSummaryResults(.output, .summary)
  renderCheckDetailResults(.output,.checkList)
}

#' (internal function) Render the results of the critical checks to the ui
#'
#' @param .output The shiny app server output object
#' @param .checkList A list of the results of the critical checks
#'
#' @export
renderCheckDetailResults <- function(.output,.checkList){
  renderCritCheck1(.output, .checkList[["criticalCheck1"]])
  renderCritCheck2(.output, .checkList[["criticalCheck2"]])
  renderCritCheck3(.output, .checkList[["criticalCheck3"]])
  renderCritCheck4(.output, .checkList[["criticalCheck4"]])
  renderCritCheck5(.output, .checkList[["criticalCheck5"]])
  renderCritCheck6(.output, .checkList[["criticalCheck6"]])
  if(!is.null(.checkList[["criticalCheck7"]])){
    renderCritCheck7(.output, .checkList[["criticalCheck7"]])
  }
  if(!is.null(.checkList[["criticalCheck8"]])){
    renderCritCheck8(.output, .checkList[["criticalCheck8"]])
  }

}
