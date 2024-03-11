#' (internal function) Render the summary results to the ui
#'
#' @param .ccSummary The critical check summary object
#' @param .ncSummary The noncritical check summary object
#' @param .output The shiny app server output object
#'
#' @export
renderSummaryResults <- function(.output, .ccSummary, .ncSummary){
  .output$criticalCheckSummaryPlaceholder <- shiny::renderUI({
    shiny::h1("Critical Check Summary")
    shiny::renderTable({
      .ccSummary
    }, rownames = FALSE)
  })

  .output$nonCriticalCheckSummaryPlaceholder <- shiny::renderUI({
    shiny::h1("Non-Critical Check Summary")
    shiny::renderTable({
      .ncSummary
    }, rownames = FALSE)
  })
}
