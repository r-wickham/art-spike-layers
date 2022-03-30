#'
#' Global objects in webapp
#'

library(purrr)

# source(file = file.path(getwd(), dir("scripts", full.names = T)))
# source("D:/gitRepo/art-spike-layers/scripts/geometry.R")

if(basename(getwd()) == "webapp"){
  source("../scripts/geometry.R")
}else{
  source("scripts/geometry.R")
}



# cat("\n\tSourcing all util scripts")
# Sources all R scripts in the scripts/utils, applying a script filter
#   to remove any scripts with instances of the scriptFilter in their
#   full path name.
# suppressPackageStartupMessages(
#   sapply(
#       dir("scripts",
#           full.names = T,
#           recursive = T),
#     source
#   )
# )
