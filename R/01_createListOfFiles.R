#' (internal function) Create a list of the R files in a specified folder
#'
#' @param .folderUrl Text url string to the folder containing the Registry Check datafiles
#'
#' @returns A list of the names of the R files in the specified folder
#'
#' @export
createListOfFiles <- function(.folderUrl){

  # Initialize the list that will be returned
  .listOfFiles <- list()

  # Generate a list of all the .RDS files in the folder
  .allRdsNames <- getAllRdsFromPath(.folderUrl)

  # Loop through and add each of the .RDS files to the list to be returned
  for(.fileName in .allRdsNames){
    .newEntry <- list(readRDS(.fileName))
    names(.newEntry) = sub(".*/", "", sub(".rds","",.fileName))
    .listOfFiles <- append(.listOfFiles, .newEntry)
  }

  # Order the list by name in descending order to make the most recent one first
  .listOfFiles <- .listOfFiles[order(names(.listOfFiles), decreasing = TRUE)]

  return(.listOfFiles)
}
