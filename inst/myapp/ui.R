# Define the UI
ui <- function(){
    shinydashboard::dashboardPage(
      shinydashboard::dashboardHeader(title = "Critical Checks")
      ,shinydashboard::dashboardSidebar(shiny::fluidRow(
          # Dropdown for main list items
          selectInput("dataPullDate", "Choose a Data Pull", choices = NULL)
        )
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
        ,shiny::tags$script(HTML("$('body').addClass('fixed');"))
        ,shiny::actionButton("downloadBtn", "Download as PDF")
        ,shiny::fluidRow(uiOutput("totalCritCheckPlaceholder"))
        ,shiny::fluidRow(uiOutput("criticalCheckOutputPlaceholder"))
      )
  )
}
