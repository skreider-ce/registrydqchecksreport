#' (internal function) Render a placeholder for the specific critical check results on the shiny app ui
#'
#' @param .checkNum The number for the specific critical check
#' @param .checkTitle The title for the specific critical check to be displayed
#'
#' @export
renderCCResultPlaceholder <- function(.checkNum, .checkTitle){
  # Canned code for each individual critical check result
  shiny::column(12
         ,shiny::column(12
                 ,shiny::h3(glue::glue("Results of Check {.checkNum} - {.checkTitle}"))
                 ,style = "background-color: lightblue;"
         )
         ,shiny::uiOutput(glue::glue("checkDetails{.checkNum}"))
  )
}
