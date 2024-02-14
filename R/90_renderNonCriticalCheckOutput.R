#' (internal function) Render the noncritical check results to the ui
#'
#' @param .output The shiny app server output object
#' @param .resultsToRender The results of the noncritical checks to render
#'
#' @export
renderNonCriticalCheckOuput <- function(.output, .resultsToRender) {

  .output$nonCriticalCheckDetails <- shiny::renderUI({
    column_elements <-
      lapply(names(.resultsToRender$nPctList), function(item) {
        shiny::column(width = 12
                      ,column(width = 12,
                              h2(glue::glue("Title: {.resultsToRender$nPctList[[item]]$checkTitle}"))
                              ,style = "background-color: rgb(252,116,8);")
                      ,h4(glue::glue("Description: {.resultsToRender$nPctList[[item]]$checkDescription}"))
                      ,p(glue::glue("Total observations: {.resultsToRender$nPctList[[item]]$values$N}"))
                      ,p(glue::glue("Number failed: {.resultsToRender$nPctList[[item]]$values$n}"))
                      ,p(glue::glue("Percentage failed: {round(.resultsToRender$nPctList[[item]]$values$pct, digits = 4)}"))
                      ,shiny::fluidRow(class = "row-padding-top row-padding-bottom"
                                       ,shiny::column(12, DT::DTOutput(paste0("subitems_",item)))
                                      )
                      ,style = "border: 2px solid;")
      })
    do.call(tagList, column_elements)
  })

  for(item_name in names(.resultsToRender$nPctList)){
    local({
      .lin <- item_name
      if(nrow(.resultsToRender$nPctList[[.lin]]$listing) > 0){
        .output[[paste0("subitems_",.lin)]] <- DT::renderDT({
          # .resultsToRender$nPctList[[.lin]]$listing
          DT::datatable(data.frame(.resultsToRender$nPctList[[.lin]]$listing[,c(0:min(ncol(.resultsToRender$nPctList[[.lin]]$listing), 5))])
                        ,options = list(pageLength = 5))
        })
      }
    })
  }

  # ,shiny::verbatimTextOutput(paste0("subitems_",item))
  # .output$checkDetails1 <- shiny::renderUI({
  #   shiny::fluidPage(
  #     shiny::fluidRow(
  #       shiny::column(12, shiny::textOutput("textOutput1"))
  #       ,shiny::column(12, shiny::textOutput("textOutput1a"))
  #     )
  #     ,shiny::fluidRow(class = "row-padding-top row-padding-bottom"
  #                      ,shiny::column(12, DT::DTOutput("dataTable1"))
  #     )
  #   )
  # })
  #
  # .output$textOutput1 <- shiny::renderText({
  #   paste0("PASS: ",.resultsToRender$pass)
  # })
  #
  # .output$textOutput1a <- shiny::renderText({
  #   paste0("Number of Duplicate Rows: ",.resultsToRender$nDuplicateRows)
  # })
  #
  # .output$dataTable1 <- DT::renderDT({
  #   DT::datatable(.resultsToRender$listOfDuplicateRows
  #                 ,options = list(pageLength = 5))
  # })

}
