#' (internal function) Render the critical check 8 results to the ui
#'
#' @param .output The shiny app server output object
#' @param .resultsToRender The results of the critical check to render
#'
#' @export
renderCritCheck8 <- function(.output, .resultsToRender){
  .output$checkDetails8 <- shiny::renderUI({
    shiny::fluidPage(
      shiny::fluidRow(
        shiny::column(12, shiny::textOutput("textOutput8"))
      )
      ,shiny::fluidRow(class = "row-padding-top row-padding-bottom"
                       ,shiny::column(12, DT::DTOutput("dataTable8"))
      )
    )
  })

  .output$textOutput8 <- shiny::renderText({
    paste0("PASS: ",.resultsToRender$pass)
  })
  .output$dataTable8 <- DT::renderDT({
    DT::datatable(.resultsToRender$essentialVariablesMissingness
                  ,options = list(pageLength = 5, dom = "t"))
  })
}
