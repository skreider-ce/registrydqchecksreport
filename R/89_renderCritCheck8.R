#' (internal function) Render the critical check 8 results to the ui
#'
#' @param .output The shiny app server output object
#' @param .resultsToRender The results of the critical check to render
#'
#' @export
renderCritCheck8 <- function(.output, .resultsToRender){
  if(is.null(.resultsToRender)){
    .output$checkDetails8 <- shiny::renderUI({
      paste0("")
    })
  } else {
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
    .dtToPrint <- .resultsToRender$essentialVariablesMissingness |>
      dplyr::select(varName, nRows, nMissing, propMissing, propMissingComp
                    ,acceptableMissingness, skipLogic)
    .output$dataTable8 <- DT::renderDT({
      DT::datatable(.dtToPrint
                    ,options = list(pageLength = 5)
                    ,rownames = FALSE
                    ,colnames = c("Var Name", "N Rows", "N Missing", "Prop Missing"
                                  ,"Last Month Prop Missing"
                                  ,"Acceptable Missing", "Skip Logic"))
    })
  }

}
