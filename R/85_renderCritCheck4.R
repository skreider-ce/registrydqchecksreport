#' (internal function) Render the critical check 4 results to the ui
#'
#' @param .output The shiny app server output object
#' @param .resultsToRender The results of the critical check to render
#'
#' @export
renderCritCheck4 <- function(.output, .resultsToRender){
  .output$checkDetails4 <- shiny::renderUI({
    shiny::fluidPage(
      shiny::fluidRow(
        shiny::column(12, shiny::textOutput("textOutput4"))
        ,shiny::column(12, shiny::textOutput("textOutput4a"))
      )
      ,shiny::fluidRow(class = "row-padding-top row-padding-bottom"
                       ,shiny::column(12, DT::DTOutput("dataTable4"))
      )
    )
  })

  .output$textOutput4 <- shiny::renderText({
    paste0("PASS: ",.resultsToRender$pass)
  })

  .output$textOutput4a <- shiny::renderText({
    paste0("Number of Missing Variable Labels: ",.resultsToRender$nMissingVariableLabels)
  })

  .output$dataTable4 <- DT::renderDT({
    DT::datatable(data.frame(.resultsToRender$listOfVarsWithMissingLabels)
                  ,options = list(pageLength = 5)
                  ,colnames = c("Variables with Missing Labels"))
  })
}
