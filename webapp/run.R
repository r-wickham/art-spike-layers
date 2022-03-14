#'
#' Runs the webapp
#'

options(warn=-1)
suppressPackageStartupMessages(library(shiny))
options(warn=1)

# Connection settings
defaultHost <- "127.0.0.1"
defaultPort <- 4458
cat(sprintf("\nOpen a brower to this url:\t%s:%s", defaultHost, defaultPort))

#Location of shiny app
dirName = sprintf("%s/webapp", getwd())

#running app
runApp(appDir = dirName,
       launch.browser=F,
       port = defaultPort,
       host = defaultHost,
       quiet = T)