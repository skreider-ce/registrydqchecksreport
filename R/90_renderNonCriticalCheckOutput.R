#' (internal function) Render the noncritical check results to the ui
#'
#' @param .output The shiny app server output object
#' @param .resultsToRender The results of the noncritical checks to render
#'
#' @export
renderNonCriticalCheckOuput <- function(.output, .resultsToRender) {


  # Loop through codebookChecks ncCheck output and output info and table placeholders
  .output$codebookNcCheckDetails <- shiny::renderUI({
    column_elements <-
      lapply(names(.resultsToRender$codebookChecks), function(item) {
        shiny::column(width = 12
                      ,shiny::column(width = 12,
                                     shiny::h2(glue::glue("{item} - Title: {.resultsToRender$codebookChecks[[item]]$checkTitle}")))
                      ,shiny::h4(glue::glue("Description: {.resultsToRender$codebookChecks[[item]]$checkDescription}"))
                      ,shiny::p(glue::glue("Total observations: {.resultsToRender$codebookChecks[[item]]$values$N}"))
                      ,shiny::p(glue::glue("Number failed: {.resultsToRender$codebookChecks[[item]]$values$n}"))
                      ,shiny::p(glue::glue("Percentage failed: {round(.resultsToRender$codebookChecks[[item]]$values$pct, digits = 4)}"))
                      ,shiny::fluidRow(class = "row-padding-top row-padding-bottom"
                                       ,shiny::column(12, DT::DTOutput(paste0("subitems_",item)))
                      )
                      ,style = "border: 2px solid;")
      })
    do.call(shiny::tagList, column_elements)
  })

  # Loop through codebookChecks ncCheck output and render tables
  for(.checkName in names(.resultsToRender$codebookChecks)){
    local({
      .currentCheckId <- .checkName
      if(nrow(.resultsToRender$codebookChecks[[.currentCheckId]]$listing) > 0){
        .output[[paste0("subitems_",.currentCheckId)]] <- DT::renderDT({
          DT::datatable(data.frame(.resultsToRender$codebookChecks[[.currentCheckId]]$listing)
                        ,options = list(pageLength = 5)
                        ,rownames = FALSE)
        })
      } else {
          .output[[paste0("subitems_",.currentCheckId)]] <- DT::renderDT({
            DT::datatable(data.frame(NULL))
          })
      }
    })
  }

  # Loop through nPctList ncCheck output and output info and table placeholders
  .output$nonCriticalCheckDetails <- shiny::renderUI({
    column_elements <-
      lapply(names(.resultsToRender$nPctList), function(item) {
        shiny::column(width = 12
                      ,shiny::column(width = 12,
                              shiny::h2(glue::glue("{item} - Title: {.resultsToRender$nPctList[[item]]$checkTitle}")))
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
          DT::datatable(data.frame(.resultsToRender$nPctList[[.lin]]$listing)
                        ,options = list(pageLength = 5)
                        ,rownames = FALSE)
        })
      } else {
        .output[[paste0("subitems_",.lin)]] <- DT::renderDT({
          DT::datatable(data.frame(NULL))
        })
      }
    })
  }



  # Loop through summaryStats ncCheck output and output info and table placeholders
  .output$summaryStatNonCriticalCheckDetails <- shiny::renderUI({
    column_elements <-
      lapply(names(.resultsToRender$summaryStats), function(item) {
        shiny::column(width = 12
                      ,shiny::column(width = 12,
                                     shiny::h2(glue::glue("{item} - Title: {.resultsToRender$summaryStats[[item]]$checkTitle}")))
                      ,shiny::h4(glue::glue("Description: {.resultsToRender$summaryStats[[item]]$checkDescription}"))
                      ,shiny::fluidRow(class = "row-padding-top row-padding-bottom"
                                       ,shiny::column(12, DT::DTOutput(paste0("subitems_",item)))
                      )
                      ,style = "border: 2px solid;")
      })
    do.call(shiny::tagList, column_elements)
  })

  # Loop through summaryStats ncCheck output and render tables
  for(item_name in names(.resultsToRender$summaryStats)){
    local({
      .lin <- item_name
      if(nrow(.resultsToRender$summaryStats[[.lin]]$listing) > 0){
        .output[[paste0("subitems_",.lin)]] <- DT::renderDT({
          DT::datatable(data.frame(.resultsToRender$summaryStats[[.lin]]$listing)
                        ,options = list(pageLength = 5)
                        ,rownames = FALSE)
        })
      } else {
        .output[[paste0("subitems_",.lin)]] <- DT::renderDT({
          DT::datatable(data.frame(NULL))
        })
      }
    })
  }

}
