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
# options(install.packages.check.source = "no")
# registrydqchecksreport::runApplication("C:/Users/ScottKreider/Documents/scrap/store/ad/2024-01-04/checks")
#
# .GlobalEnv$.outputUrl = "C:/Users/ScottKreider/Documents/scrap/store/2023-12-04/checks"

# names(createListOfFiles("C:/Users/ScottKreider/Documents/scrap/store/2023-12-04/checks"))

# myResults <- readRDS("C:/Users/ScottKreider/Documents/scrap/store/ibd/2024-02-01/checks/2024-02-01_2024_02_07_10_35_57_checks.rds")
# myResults$criticalChecks
# toInput <- myResults$criticalChecks[["exlab"]]
# is.null(toInput$criticalCheck7)
# View(toInput)
# extractPassFail(myResults$criticalChecks[["exlab"]])
#
# for(a in toInput){
#   print(a)
# }
