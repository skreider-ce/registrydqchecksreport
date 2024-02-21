#' (internal function) Render the noncritical check results to the ui
#'
#' @param .output The shiny app server output object
#' @param .resultsToRender The results of the noncritical checks to render
#'
#' @export
renderNonCriticalCheckOuput <- function(.output, .resultsToRender) {

  # Loop through nPctList ncCheck output and output info and table placeholders
  .output$nonCriticalCheckDetails <- shiny::renderUI({
    column_elements <-
      lapply(names(.resultsToRender$nPctList), function(item) {
        shiny::column(width = 12
                      ,shiny::column(width = 12,
                              shiny::h2(glue::glue("Title: {.resultsToRender$nPctList[[item]]$checkTitle}"))
                              ,style = "background-color: rgb(252,116,8);")
                      ,shiny::h4(glue::glue("Description: {.resultsToRender$nPctList[[item]]$checkDescription}"))
                      ,shiny::p(glue::glue("Total observations: {.resultsToRender$nPctList[[item]]$values$N}"))
                      ,shiny::p(glue::glue("Number failed: {.resultsToRender$nPctList[[item]]$values$n}"))
                      ,shiny::p(glue::glue("Percentage failed: {round(.resultsToRender$nPctList[[item]]$values$pct, digits = 4)}"))
                      ,shiny::fluidRow(class = "row-padding-top row-padding-bottom"
                                       ,shiny::column(12, DT::DTOutput(paste0("subitems_",item)))
                                      )
                      ,style = "border: 2px solid;")
      })
    do.call(shiny::tagList, column_elements)
  })

  # Loop through nPctList ncCheck output and render tables
  for(item_name in names(.resultsToRender$nPctList)){
    local({
      .lin <- item_name
      if(nrow(.resultsToRender$nPctList[[.lin]]$listing) > 0){
        .output[[paste0("subitems_",.lin)]] <- DT::renderDT({
          DT::datatable(data.frame(.resultsToRender$nPctList[[.lin]]$listing[,c(0:min(ncol(.resultsToRender$nPctList[[.lin]]$listing), 5))])
                        ,options = list(pageLength = 5))
        })
      }
    })
  }

}
