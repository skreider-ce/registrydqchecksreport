# Define the UI
ui <- function(){
    shinydashboard::dashboardPage(
      shinydashboard::dashboardHeader(title = "Data Quality Report")
      ,shinydashboard::dashboardSidebar(shiny::fluidRow(
          # Dropdown for main list items
          selectInput("dataPullDate", "Choose a Report Run Date", choices = NULL)
        )
        # Dropdown for datasets to choose
        ,shiny::fluidRow(
          shiny::selectInput("datasetName", "Choose a Dataset", choices = NULL)
        )
      )
      ,shinydashboard::dashboardBody(
        shiny::tags$head(
          shiny::tags$style(
            shiny::HTML(
              ".row-padding-top{
                margin-top: 30px;
              }
              .row-padding-bottom{
                margin-bottom: 30px;
              }"
            )
          )
        )
        # Define locations for rest of the report body
        ,shiny::tags$script(HTML("$('body').addClass('fixed');"))
        ,shiny::fluidRow(uiOutput("runnerSummaryPlaceholder"))
        ,shiny::h2("Summary of Critical Checks")
        ,shiny::fluidRow(uiOutput("totalCritCheckPlaceholder"))
        ,shiny::h2("Summary of NonCritical Checks")
        ,shiny::fluidRow(uiOutput("totalNonCritCheckPlaceholder"))
        ,shiny::fluidRow(uiOutput("criticalCheckOutputPlaceholder"))
      )
  )
}
