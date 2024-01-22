#' @export
renderCritCheck2 <- function(.output, .resultsToRender){
  .output$checkDetails2 <- shiny::renderUI({
    shiny::fluidPage(
      shiny::fluidRow(
        shiny::column(12, shiny::textOutput("textOutput2"))
        ,shiny::column(12, shiny::textOutput("textOutput2a"))
      )
      ,shiny::fluidRow(
        shiny::column(12, DT::DTOutput("dataTable2"))
      )
    )
  })

  .output$textOutput2 <- shiny::renderText({
    paste0("PASS: ",.resultsToRender$pass)
  })

  .output$textOutput2a <- shiny::renderText({
    paste0("Number of Omitted Variables: ",.resultsToRender$nOmittedVars)
  })

  .output$dataTable2 <- DT::renderDT({
    DT::datatable(data.frame(.resultsToRender$omittedVars), options = list(pageLength = 5))
  })
}
