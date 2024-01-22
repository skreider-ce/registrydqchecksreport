#' @export
renderCritCheck7 <- function(.output, .resultsToRender){
  .output$checkDetails7 <- shiny::renderUI({
    shiny::fluidPage(
      shiny::fluidRow(
        shiny::column(12, shiny::textOutput("textOutput7"))
      )
      ,shiny::fluidRow(
        shiny::column(12, DT::DTOutput("dataTable7"))
      )
    )
  })

  .output$textOutput7 <- shiny::renderText({
    paste0("PASS: ",.resultsToRender$pass)
  })
  .output$dataTable7 <- DT::renderDT({
    DT::datatable(.resultsToRender$essentialVariablesMissingness, options = list(pageLength = 5))
  })
}
