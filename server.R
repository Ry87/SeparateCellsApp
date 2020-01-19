
library(DT)
library(tidyverse)


shinyServer(function(input, output) {

  output$input <- DT::renderDataTable(inputData(),selection = list(target='column'))
  output$output <- DT::renderDataTable(outputData(),selection = list(target='column'))
  

  inputData <- reactive({if(is.null(input$inputFile)) return(NULL)
    read.csv(input$inputFile$datapath,row.names=1, header = TRUE, sep=",")
  })
  
  outputData <- reactive({
    GetOutputData()
  })
  
  GetOutputData <- function(){
    data <- inputData()
    if(is.null(inputData())){return(NULL)}
    mergedCellColumns <- FindMergedCellColumns(data)
    if(is.null(mergedCellColumns)){return(NULL)}
    for(col in mergedCellColumns){
      data <- data %>%tidyr::separate_rows(col,sep = "\n")
    }
    return(data)
  }
  
  FindMergedCellColumns <- function(data){
    hasMergedCell <- sapply(data, function(x){any(str_detect(x,pattern="\n"))})
    mergedCellColumns <- names(which(hasMergedCell==TRUE))
    return(mergedCellColumns)
  }
  
  output$outputExport <- downloadHandler(
    filename = "output.csv",
    content = function(file) {
      write.csv(GetOutputData(), file)
    })
})
