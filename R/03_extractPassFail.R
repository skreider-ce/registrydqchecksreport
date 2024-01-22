#' @export
extractPassFail <- function(.resultsList){

  .passFailList <- data.frame()

  for(.result in .resultsList){
    .passFailList <- append(.passFailList, {names(.result) = .result$pass})
  }

  names(.passFailList) <- names(.resultsList)

  return(.passFailList)
}


# Extract pass/fail results from all the datasets for this datapull
#' @export
extractPassFailUpper <- function(.dsList){

  .passFailList2 <- c()
  .pfList <- list()

  for(.dsName in names(.dsList)){
    for(.result in names(.dsList[[.dsName]])){
      .passFailList2 <- c(.passFailList2, .dsList[[.dsName]][[.result]]$pass)
    }
  }

  return(.passFailList2)
}
