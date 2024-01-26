#' (internal function) Render a placeholder for the critical check summary results on the shiny app ui
#'
#' @export
renderCCSummaryPlaceholder <- function(){
  shiny::column(12
         ,shiny::h2("Summary of Critical Checks")
         ,shiny::uiOutput("criticalCheckSummaryPlaceholder"))
}
