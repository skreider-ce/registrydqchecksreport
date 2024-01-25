#' @export
runApplication <- function(outputUrl){

  .GlobalEnv$.outputUrl = outputUrl

  appDir <- system.file("myapp", package = "regdqchecks")
  if (appDir == "") {
    stop("Could not find myapp. Try re-installing `regdqchecks`.", call. = FALSE)
  }

  shiny::runApp(appDir, display.mode = "normal")
}


# outputUrl <- "C:/Users/ScottKreider/Corrona LLC/Biostat and Epi Team Site - Registry Data QC Checks/registryCheckStorage/ad"


# regdqchecks::runApplication(outputUrl = "C:/Users/ScottKreider/Corrona LLC/Biostat and Epi Team Site - Registry Data QC Checks/registryCheckStorage/ad")
# regdqchecks::runApplication(outputUrl = "C:/Users/ScottKreider/Corrona LLC/Biostat and Epi Team Site - Registry Data QC Checks/registryCheckStorage/ms")
# regdqchecks::runApplication(outputUrl = "C:/Users/ScottKreider/Corrona LLC/Biostat and Epi Team Site - Registry Data QC Checks/registryCheckStorage/pso")
