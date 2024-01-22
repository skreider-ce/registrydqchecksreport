# Render the check results in the body of the UI
#' @export
renderBodyResults <- function(.output,.summary,.checkList){
  renderSummaryResults(.output, .summary)
  renderCheckDetailResults(.output,.checkList)
}

#' @export
renderCheckDetailResults <- function(.output,.checkList){
  renderCritCheck1(.output, .checkList[["criticalCheck1"]])
  renderCritCheck2(.output, .checkList[["criticalCheck2"]])
  renderCritCheck3(.output, .checkList[["criticalCheck3"]])
  renderCritCheck4(.output, .checkList[["criticalCheck4"]])
  renderCritCheck5(.output, .checkList[["criticalCheck5"]])
  renderCritCheck6(.output, .checkList[["criticalCheck6"]])
  renderCritCheck7(.output, .checkList[["criticalCheck7"]])
  renderCritCheck8(.output, .checkList[["criticalCheck8"]])
}
