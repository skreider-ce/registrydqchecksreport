#' (internal function) Get a list of the names of all the R data files in a specified folder
#'
#' @param .folderUrl A character url to the folder with the R datasets of interest
#'
#' @returns A list containing the names of all the R datasets in the folder
#'
#' @export
getAllRdsFromPath <- function(.folderUrl){

  # Make a list of all the files in the folder
  .allFiles <- list.files(path = .folderUrl, full.names = TRUE)

  # Subset down to just the .RDS files
  .rdsFiles <- .allFiles[grep("\\.RDS$", .allFiles, ignore.case = TRUE)]

  return(.rdsFiles)
}
