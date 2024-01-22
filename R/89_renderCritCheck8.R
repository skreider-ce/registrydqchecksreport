#' @export
renderCritCheck8 <- function(.output, .resultsToRender){
  .output$checkDetails8 <- shiny::renderUI({
    shiny::fluidPage(
      shiny::fluidRow(
        shiny::column(12, shiny::textOutput("textOutput8"))
      )
      ,shiny::fluidRow(
        shiny::column(12, DT::DTOutput("dataTable8"))
      )
    )
  })

  .output$textOutput8 <- shiny::renderText({
    paste0("PASS: ",.resultsToRender$pass)
  })
  .output$dataTable8 <- DT::renderDT({
    DT::datatable(.resultsToRender$essentialVariablesMissingness, options = list(pageLength = 5))
  })
}
