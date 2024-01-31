# Define the server logic
server <- function(input, output, session) {

  # Get list of critical check RDS files from the specified folder location
  myFiles <- createListOfFiles(.GlobalEnv$.outputUrl)

  # Update the dropdown on the UI to show the choices of the names of the files
  shiny::updateSelectInput(session, "dataPullDate", choices = names(myFiles))

  # Create placeholder reactive values for pullDate and datasetName
  .selectedPullDate <- shiny::reactiveVal(NULL)
  .selectedDsName <- shiny::reactiveVal(NULL)
  .selectedPassFail <- shiny::reactiveVal(NULL)
  .selectedPassFailUpper <- shiny::reactiveVal(NULL)

  # When a pullDate is selected - update the datasetSelect accordingly
  shiny::observe({
    .selectedPullDate(input$dataPullDate)
    shiny::updateSelectInput(session, "datasetName", choices = c(names(myFiles[[input$dataPullDate]])))

    .selectedPassFailUpper(extractPassFailUpper(myFiles[[.selectedPullDate()]]))
    output$totalCritCheckPlaceholder <- shiny::renderUI({
      shiny::renderPrint({
        paste0(.selectedPassFailUpper())
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
      .selectedPassFail(extractPassFail(myFiles[[.selectedPullDate()]][[.selectedDsName()]]))
      # Dynamically render critical check placeholders to UI
      renderBodyPlaceholders(output)
      renderBodyResults(output,.selectedPassFail(),myFiles[[.selectedPullDate()]][[.selectedDsName()]])
    }
  })

  shiny::observeEvent(input$go, {
    print("ss")
    shinyscreenshot::screenshot(filename = "C:/Users/ScottKreider/Documents/scrap/outp.png")
  })
}
