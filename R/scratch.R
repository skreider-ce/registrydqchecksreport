# library(remotes)
# remotes::install_github("skreider-ce/registrydqchecksreport")
# remotes::install_github("skreider-ce/registrydqchecks")
# library(registrydqchecksreport)
# library(registrydqchecks)
# registrydqchecks::runRegistryChecks("ad"
#                   ,.prelimDataFolderUrl = "C:/Users/ScottKreider/Corrona LLC/Biostat Data Files - AD/monthly/2023/2023-12-04"
#                   ,.prelimDataPullDate = "2023-12-04"
#                   ,.lastMonthDataFolderUrl = "C:/Users/ScottKreider/Corrona LLC/Biostat Data Files - AD/monthly/2023/2023-11-03"
#                   ,.lastMonthDataPullDate = "2023-11-03"
#                   ,.codebookUrl = "C:/Users/ScottKreider/Corrona LLC/Biostat and Epi Team Site - Registry Data QC Checks/Guidance Documentation/archive/desired codebook input format.xlsx"
#                   ,.datasetsToCheck = c("exvisit", "exlab", "exdrugexp")
#                   ,.outputUrl = "C:/Users/ScottKreider/Documents/scrap/store/2023-12-04"
#                   ,.isR = TRUE)




#
# remove.packages("registrydqchecksreport")
# remotes::install_github("skreider-ce/registrydqchecksreport")
# library(registrydqchecksreport)
# registrydqchecksreport::runApplication("C:/Users/ScottKreider/Documents/scrap/store/2023-12-04/checks")
#
# .GlobalEnv$.outputUrl = "C:/Users/ScottKreider/Documents/scrap/store/2023-12-04/checks"

# names(createListOfFiles("C:/Users/ScottKreider/Documents/scrap/store/2023-12-04/checks"))

# myResults$criticalChecks <- readRDS("C:/Users/ScottKreider/Documents/scrap/store/2024-01-04/checks/2024-01-04_2024_02_07_09_49_34_checks.rds")
# toInput <- myResults$criticalChecks[["exlab"]]
# is.null(toInput$criticalCheck7)
# View(toInput)
# extractPassFail(myResults$criticalChecks[["exlab"]])
#
# for(a in toInput){
#   print(a)
# }
