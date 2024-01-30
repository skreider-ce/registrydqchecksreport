#' (internal function) Render the critical check 7 results to the ui
#'
#' @param .output The shiny app server output object
#' @param .resultsToRender The results of the critical check to render
#'
#' @export
renderCritCheck7 <- function(.output, .resultsToRender){
  .output$checkDetails7 <- shiny::renderUI({
    shiny::fluidPage(
      shiny::fluidRow(
        shiny::column(12, shiny::textOutput("textOutput7"))
      )
      ,shiny::fluidRow(class = "row-padding-top row-padding-bottom"
                       ,shiny::column(12, DT::DTOutput("dataTable7"))
      )
    )
  })

  .output$textOutput7 <- shiny::renderText({
    paste0("PASS: ",.resultsToRender$pass)
  })
  .output$dataTable7 <- DT::renderDT({
    DT::datatable(.resultsToRender$essentialVariablesMissingness
                  ,options = list(pageLength = 5, dom = "t")
                  ,colnames = c("Variable Name", "Number of Rows", "Number Missing", "Proportion Missing"))
  })
}
