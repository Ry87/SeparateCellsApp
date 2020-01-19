
shinyUI(fluidPage(
  titlePanel("SeparateCellsApp"),
  
  sidebarLayout(
    sidebarPanel(
           fileInput(inputId = "inputFile", label = "Import csv:"),
           downloadButton(outputId="outputExport",label="Export")
    ),
    
    mainPanel(tabsetPanel(
      tabPanel("input",DT::dataTableOutput("input")),
      tabPanel("output",DT::dataTableOutput("output"))
    ))
    

  )
))
