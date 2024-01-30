#' (internal function) Render the critical check 6 results to the ui
#'
#' @param .output The shiny app server output object
#' @param .resultsToRender The results of the critical check to render
#'
#' @export
renderCritCheck6 <- function(.output, .resultsToRender){
  .output$checkDetails6 <- shiny::renderUI({
    shiny::fluidPage(
      shiny::fluidRow(
        shiny::column(12, shiny::textOutput("textOutput6"))
        ,shiny::column(12, shiny::textOutput("textOutput6a"))
      )
      ,shiny::fluidRow(class = "row-padding-top row-padding-bottom"
                       ,shiny::column(12, DT::DTOutput("dataTable6"))
      )
    )
  })

  .output$textOutput6 <- shiny::renderText({
    paste0("PASS: ",.resultsToRender$pass)
  })

  .output$textOutput6a <- shiny::renderText({
    paste0("Number of Removed Rows: ",.resultsToRender$nRemovedRows)
  })

  .output$dataTable6 <- DT::renderDT({
    DT::datatable(data.frame(.resultsToRender$inOldAndNotInNew)
                  ,options = list(pageLength = 5, dom = "t"))
  })
}
