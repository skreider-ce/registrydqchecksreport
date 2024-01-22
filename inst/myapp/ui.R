# Define the UI
ui <- shinydashboard::dashboardPage(
  shinydashboard::dashboardHeader(title = "Critical Checks"),
  shinydashboard::dashboardSidebar(
    shiny::fluidRow(
      # Dropdown for main list items
      selectInput("dataPullDate", "Choose a Data Pull Date", choices = NULL)
    )
    ,shiny::fluidRow(
      shiny::selectInput("datasetName", "Choose a Dataset", choices = NULL)
    )

  ),
  shinydashboard::dashboardBody(
    shiny::tags$script(HTML("$('body').addClass('fixed');"))
    ,shiny::actionButton("downloadBtn", "Download as PDF")
    ,shiny::fluidRow(uiOutput("totalCritCheckPlaceholder"))
    ,shiny::fluidRow(uiOutput("criticalCheckOutputPlaceholder"))
  )
)
