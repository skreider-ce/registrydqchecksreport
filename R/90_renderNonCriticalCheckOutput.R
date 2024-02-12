#' (internal function) Render the noncritical check results to the ui
#'
#' @param .output The shiny app server output object
#' @param .resultsToRender The results of the noncritical checks to render
#'
#' @export
renderNonCriticalCheckOuput <- function(.output, .resultsToRender) {

  .output$nonCriticalCheckDetails <- shiny::renderUI({
    column_elements <-
      lapply(names(.resultsToRender$nPctList), function(item) {
        shiny::column(width = 12
                      ,h4(item)
                      ,shiny::verbatimTextOutput(paste0("subitems_",item)))
      })
    do.call(tagList, column_elements)
  })

  for(item_name in names(.resultsToRender$nPctList)){
    local({
      .lin <- item_name
      .output[[paste0("subitems_",.lin)]] <- shiny::renderPrint({
        .resultsToRender$nPctList[[.lin]]
      })
    })
  }

  # .output$checkDetails1 <- shiny::renderUI({
  #   shiny::fluidPage(
  #     shiny::fluidRow(
  #       shiny::column(12, shiny::textOutput("textOutput1"))
  #       ,shiny::column(12, shiny::textOutput("textOutput1a"))
  #     )
  #     ,shiny::fluidRow(class = "row-padding-top row-padding-bottom"
  #                      ,shiny::column(12, DT::DTOutput("dataTable1"))
  #     )
  #   )
  # })
  #
  # .output$textOutput1 <- shiny::renderText({
  #   paste0("PASS: ",.resultsToRender$pass)
  # })
  #
  # .output$textOutput1a <- shiny::renderText({
  #   paste0("Number of Duplicate Rows: ",.resultsToRender$nDuplicateRows)
  # })
  #
  # .output$dataTable1 <- DT::renderDT({
  #   DT::datatable(.resultsToRender$listOfDuplicateRows
  #                 ,options = list(pageLength = 5))
  # })

}
