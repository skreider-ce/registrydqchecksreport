#' (internal function) Render the critical check 5 results to the ui
#'
#' @param .output The shiny app server output object
#' @param .resultsToRender The results of the critical check to render
#'
#' @export
renderCritCheck5 <- function(.output, .resultsToRender){
  .output$checkDetails5 <- shiny::renderUI({
    shiny::fluidPage(
      shiny::fluidRow(
        shiny::column(12, shiny::textOutput("textOutput5"))
        ,shiny::column(12, shiny::textOutput("textOutput5a"))
        ,shiny::column(12, shiny::textOutput("textOutput5b"))
        ,shiny::column(12, shiny::textOutput("textOutput5c"))
      )
    )
  })

  .output$textOutput5 <- shiny::renderText({
    paste0("PASS: ",.resultsToRender$pass)
  })

  .output$textOutput5a <- shiny::renderText({
    paste0("Number of Added Rows: ",.resultsToRender$nAddedRows)
  })

  .output$textOutput5b <- shiny::renderText({
    paste0("Number of Old Rows: ",.resultsToRender$nOldRows)
  })

  .output$textOutput5c <- shiny::renderText({
    paste0("Proportion Increase of Added Rows: ", .resultsToRender$propRowIncrease)
  })
}
