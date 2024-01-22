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
