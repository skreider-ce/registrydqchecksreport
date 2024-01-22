#' @export
getAllRdsFromPath <- function(.folderUrl){

  # Make a list of all the files in the folder
  .allFiles <- list.files(path = .folderUrl, full.names = TRUE)

  # Subset down to just the .RDS files
  .rdsFiles <- .allFiles[grep("\\.RDS$", .allFiles, ignore.case = TRUE)]

  return(.rdsFiles)
}
