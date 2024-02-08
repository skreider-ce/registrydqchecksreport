#' (internal function) Function to render a placeholder in the shiny app ui for the check results
#'
#' @param .output The shinyapp output object
#'
#' @export
renderBodyPlaceholders <- function(.output){
  .output$criticalCheckOutputPlaceholder <- shiny::renderUI({
    criticalCheckBodyOutput()
  })
}


#' (internal function) Canned code to render placeholders for the critical check summary and results
#'
#' @export
criticalCheckBodyOutput <- function(){
  shiny::renderUI({
    shiny::fluidRow(
      renderCCSummaryPlaceholder()
      ,renderCCResultPlaceholder(1, "Duplicate rows")
      ,renderCCResultPlaceholder(2, "Variables in this month and not in last month")
      ,renderCCResultPlaceholder(3, "Variables from last month and not in this month")
      ,renderCCResultPlaceholder(4, "Unlabeled variables")
      ,renderCCResultPlaceholder(5, "Added rows")
      ,renderCCResultPlaceholder(6, "Disappearing rows")
      ,renderCCResultPlaceholder(7, "Essential Variable Nonresponse")
      ,renderCCResultPlaceholder(8, "Essential Variable MoM (month over month) Nonresponse")
      ,renderNCResultPlaceholder()
    )
  })
}
