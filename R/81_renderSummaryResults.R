#' @export
renderSummaryResults <- function(.output, .summary){
  .output$criticalCheckSummaryPlaceholder <- shiny::renderUI({
    shiny::h1("SUMMARY")
    shiny::renderTable({
      .summary
    }, rownames = FALSE)
  })
}
