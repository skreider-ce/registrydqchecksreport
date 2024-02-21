# Define the server logic
server <- function(input, output, session) {

  # Get list of critical check RDS files from the specified folder location
  myFiles <- createListOfFiles(.GlobalEnv$.outpUrl)

  # Update the dropdown on the UI to show the choices of the names of the files
  shiny::updateSelectInput(session, "dataPullDate", choices = names(myFiles))

  # Create placeholder reactive values for pullDate and datasetName
  .selectedPullDate <- shiny::reactiveVal(NULL)
  .selectedDsName <- shiny::reactiveVal(NULL)
  .selectedPassFail <- shiny::reactiveVal(NULL)
  .selectedPassFailUpper <- shiny::reactiveVal(NULL)
  .selectedRunnerSummary <- shiny::reactiveVal(NULL)

  # When a pullDate is selected - update the datasetSelect accordingly
  shiny::observe({
    .selectedPullDate(input$dataPullDate)
    shiny::updateSelectInput(session, "datasetName", choices = c(names(myFiles[[input$dataPullDate]]$criticalChecks)))

    # Display runner summary on the report
    if(.selectedPullDate() != ""){
      .selectedRunnerSummary(myFiles[[.selectedPullDate()]]$runnerSummary)
      output$runnerSummaryPlaceholder <- shiny::renderUI({
        shiny::renderPrint({
          paste0(.selectedRunnerSummary())
        })
      })
    }

    # Display critical check summary on the report
    output$totalCritCheckPlaceholder <- shiny::renderUI({
      shiny::renderPrint({
        print(myFiles[[.selectedPullDate()]]$checkSummary$criticalCheckSummary)
      })
    })

    # Display noncritical check summary on the report
    output$totalNonCritCheckPlaceholder <- shiny::renderUI({
      shiny::renderPrint({
        print(myFiles[[.selectedPullDate()]]$checkSummary$nonCriticalCheckSummary)
      })
    })
  })

  # When a datasetName is selected - store that selection in a variable
  shiny::observe({
    if(!is.null(.selectedPullDate())){
      .selectedDsName(input$datasetName)
    }
  })

  shiny::observe({
    if(!is.null(.selectedDsName())){
      .selectedPassFail(extractPassFail(myFiles[[.selectedPullDate()]]$criticalChecks[[.selectedDsName()]]))
      # Dynamically render critical check placeholders to UI
      renderBodyPlaceholders(output)
      # Render the results of the checks to the report
      renderBodyResults(.output = output
                        ,.summary = .selectedPassFail()
                        ,.criticalCheckList = myFiles[[.selectedPullDate()]]$criticalChecks[[.selectedDsName()]]
                        ,.nonCriticalCheckList = myFiles[[.selectedPullDate()]]$nonCriticalChecks[[.selectedDsName()]])
    }
  })

  # Event listener for the download as png button
  # COULD be made obsolete with registrydqcheckreportdown html output
  shiny::observeEvent(input$downloadBtn, {
    print("ss")
    shinyscreenshot::screenshot(filename = glue::glue("{.selectedDsName()}_{.selectedPullDate()}"))
  })
}
