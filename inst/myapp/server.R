# Define the server logic
server <- function(input, output, session) {

  # Get list of critical check RDS files from the specified folder location
  myFiles <- createListOfFiles(.GlobalEnv$.outpUrl)

  # Update the dropdown on the UI to show the choices of the names of the files
  shiny::updateSelectInput(session, "dataPullDate", choices = names(myFiles))

  # Create placeholder reactive values for pullDate and datasetName
  .selectedPullDate <- shiny::reactiveVal(NULL)
  .selectedDsName <- shiny::reactiveVal(NULL)
  .selectedCcPassFail <- shiny::reactiveVal(NULL)
  .selectedNcPassFail <- shiny::reactiveVal(NULL)
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
          print("Runner Summary")
          print(.selectedRunnerSummary())
        })
      })
    }

    # Display critical check summary on the report
    output$totalCritCheckPlaceholder <- shiny::renderUI({
      DT::datatable(myFiles[[.selectedPullDate()]]$checkSummary$criticalCheckSummary
                    ,rownames = FALSE
                    ,options = list(
                      paging = FALSE,  # Display all rows (no pagination)
                      searching = FALSE  # Hide search bar
                    )) |>
        DT::formatStyle(
          names(myFiles[[.selectedPullDate()]]$checkSummary$criticalCheckSummary)
          ,backgroundColor = DT::styleEqual(c("Fail", "Pass"), c("#FF7F7F", "#D1FFBD"))
        )
    })

    # Display noncritical check summary on the report
    output$totalNonCritCheckPlaceholder <- shiny::renderUI({
      DT::datatable(myFiles[[.selectedPullDate()]]$checkSummary$nonCriticalCheckSummary
                    ,rownames = FALSE
                    ,options = list(
                      paging = FALSE,  # Display all rows (no pagination)
                      searching = FALSE  # Hide search bar
                    ))
    })
  })

  # When a datasetName is selected - store that selection in a variable
  shiny::observe({
    if(!is.null(.selectedPullDate())){
      .selectedDsName(input$datasetName)
    }
  })

  shiny::observe({
    if(.selectedDsName() != ""){
      # print(myFiles[[.selectedPullDate()]]$checkSummary$criticalCheckSummary)

      .selectedCcPassFail(myFiles[[.selectedPullDate()]]$checkSummary$criticalCheckSummary |>
                          dplyr::filter(dataset == .selectedDsName()))
      .selectedNcPassFail(myFiles[[.selectedPullDate()]]$checkSummary$nonCriticalCheckSummary |>
                            dplyr::filter(dataset == .selectedDsName()))

      # Dynamically render critical check placeholders to UI
      renderBodyPlaceholders(output, .selectedDsName())
      # Render the results of the checks to the report
      renderBodyResults(.output = output
                        ,.ccSummary = .selectedCcPassFail()
                        ,.ncSummary = .selectedNcPassFail()
                        ,.criticalCheckList = myFiles[[.selectedPullDate()]]$criticalChecks[[.selectedDsName()]]
                        ,.nonCriticalCheckList = myFiles[[.selectedPullDate()]]$nonCriticalChecks[[.selectedDsName()]])
    }
  })
}
