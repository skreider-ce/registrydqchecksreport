#' @export
renderCritCheck3 <- function(.output, .resultsToRender){
  .output$checkDetails3 <- shiny::renderUI({
    shiny::fluidPage(
      shiny::fluidRow(
        shiny::column(12, shiny::textOutput("textOutput3"))
      )
      ,shiny::fluidRow(
        shiny::column(12, DT::DTOutput("dataTable3"))
      )
    )
  })

  .output$textOutput3 <- shiny::renderText({
    paste0("PASS: ",.resultsToRender$pass)
  })
  .output$dataTable3 <- DT::renderDT({
    DT::datatable(data.frame(.resultsToRender$extraVars), options = list(pageLength = 5))
  })
}
