#' (internal function) Render a placeholder for the noncritical check results on the shiny app ui
#'
#' @export
renderNCResultPlaceholder <- function(){
  # Canned code for each individual critical check result
  shiny::column(12
                ,style = "border: 2px solid;"
                ,shiny::column(12
                               ,shiny::h3(glue::glue("Results of NonCritical Checks"))
                               ,style = "background-color: lightblue;"
                )
                ,shiny::uiOutput(glue::glue("codebookNcCheckDetails"))
                ,shiny::uiOutput(glue::glue("nonCriticalCheckDetails"))
  )
}
