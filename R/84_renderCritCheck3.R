#' (internal function) Render the critical check 3 results to the ui
#'
#' @param .output The shiny app server output object
#' @param .resultsToRender The results of the critical check to render
#'
#' @export
renderCritCheck3 <- function(.output, .resultsToRender){
  .output$checkDetails3 <- shiny::renderUI({
    shiny::fluidPage(
      shiny::fluidRow(
        shiny::column(12, shiny::textOutput("textOutput3"))
      )
      ,shiny::fluidRow(class = "row-padding-top row-padding-bottom"
                       ,shiny::column(12, DT::DTOutput("dataTable3"))
      )
    )
  })

  .output$textOutput3 <- shiny::renderText({
    paste0("PASS: ",.resultsToRender$pass)
  })
  .output$dataTable3 <- DT::renderDT({
    DT::datatable(data.frame(.resultsToRender$extraVars)
                  ,options = list(pageLength = 5)
                  ,colnames = c("Extra Variables"))
  })
}
