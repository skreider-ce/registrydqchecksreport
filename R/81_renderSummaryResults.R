#' (internal function) Render the summary results to the ui
#'
#' @param .output The shiny app server output object
#' @param .summary The summary object to be rendered
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
