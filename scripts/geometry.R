#'
#' Geometry functions
#'

library(purrr)


initPlot <- function(axesAndGrid = T){
  par(xaxs="i", yaxs="i")
  plot(NA, xlim=c(0,100), ylim=c(0,100), axes=F, xlab = "", ylab = "")
  if(axesAndGrid){
    sapply(1:4, axis)
    grid()
    graphics::box()
  }
}


#' Create spike layer
#'
#' @param side        string, indicating either "right" or "left" side
#' @param xPos        integer, location on x-axis
#' @param nTriangles  integer, number of triangles in row
#' @param noise       integer, amount of random noise to introduce
plotSpikeLayer <- function(side = "left",
                           xPos = 40,
                           triangleHeight = 10,
                           triangleWidth = 10,
                           noise = 0,
                           fillCol = "white"){
  upperY <- 110
  lowerY <- baseY <- -10
  xBegin <- ifelse(side == "left", -10, 110)
  
  # Initial determination of the number of trianges
  nTriangles <- 
    seq(lowerY, upperY, by = triangleWidth) %>%
    length()
  # Heights of each triangle
  heights <- 
    rep(triangleHeight, nTriangles) + 
    rnorm(n = nTriangles, mean = 0, sd = noise)
  # widths of each triange
  widths <- 
    rep(triangleWidth, nTriangles) + 
    rnorm(n = nTriangles, mean = 0, sd = noise)
  # Slope (y/x) in plot space
  slopes <- widths/heights/2
  
  # Create polygons for each triangle
  for(i in 1:nTriangles){
    if(side == "left"){
      y <- c(baseY - slopes[i]*(xPos - xBegin),
             baseY + slopes[i]*(xPos - xBegin),
             baseY)
      x <- c(xBegin, xBegin, xPos + heights[i])
    }else{
      y <- c(baseY - slopes[i]*(xPos - xBegin),
             baseY,
             baseY + slopes[i]*(xPos - xBegin))
      x <- c(xBegin, xPos - heights[i], xBegin)
    }
    
    
    # cat(sprintf("\n x = %s\n y = %s", as.character(x), as.character(y)))
    
    polygon(x, y, col = fillCol)
    baseY <- baseY + widths[1]
  }
  Sys.sleep(time = 0.01)
}

#' Creates the plot given
#'
#'
createPlot <- function(plotInput = NULL,
                       useDefault = F,
                       onlyInit = F,
                       axesAndGrid = T){
  
  # Default inputs
  if(useDefault | is.null(plotInput)){
    plotInput <- list(
      
      seed = 123,
      
      leftNoise = 0.8,
      leftStart = 40,
      leftXDistance = 5,
      leftHeight = 4,
      leftWidth = 4,
      leftCol = "red",
      
      rightNoise = 0.8,
      rightStart = 60,
      rightXDistance = 5,
      rightHeight = 4,
      rightWidth = 4,
      rightCol = "grey"
    )
  }
  
  set.seed(plotInput$seed)
  
  initPlot(axesAndGrid = axesAndGrid)
  
  if(onlyInit) return(NULL)
  
    for(xPos in seq(from=plotInput$leftStart,
                    to=-5,
                    by=-plotInput$leftXDistance)){
      plotSpikeLayer(side = "left",
                     noise = plotInput$leftNoise,
                     xPos = xPos,
                     fillCol = plotInput$leftCol,
                     triangleHeight = plotInput$leftHeight,
                     triangleWidth = plotInput$leftWidth)
    }
    
    for(xPos in seq(from = plotInput$rightStart,
                    to = 105,
                    by = plotInput$rightXDistance)){
      plotSpikeLayer(side = "right",
                     noise = plotInput$rightNoise,
                     xPos = xPos,
                     fillCol = plotInput$rightCol,
                     triangleHeight = plotInput$rightHeight,
                     triangleWidth = plotInput$rightWidth)
    }
  if(axesAndGrid) box()
}


