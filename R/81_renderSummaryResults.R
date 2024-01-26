#' (internal function) Render the summary results to the ui
#'
#' @param .output The shiny app server output object
#' @param .summary The summary object to be rendered
#'
#' @export
renderSummaryResults <- function(.output, .summary){
  .output$criticalCheckSummaryPlaceholder <- shiny::renderUI({
    shiny::h1("SUMMARY")
    shiny::renderTable({
      .summary
    }, rownames = FALSE)
  })
}
