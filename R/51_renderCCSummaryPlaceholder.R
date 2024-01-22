#' @export
renderCCSummaryPlaceholder <- function(){
  shiny::column(12
         ,shiny::h2("Summary of Critical Checks")
         ,shiny::uiOutput("criticalCheckSummaryPlaceholder"))
}
