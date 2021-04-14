# This shiny app is an example of editable DT by the user on the shiny-client side . 
# The data are stored on a local file (table_modifier.csv)

# Load libraries
library(shiny)
library(shinydashboard)
library(tidyverse)
library(DT)
library(data.table)


# UI Part
ui <-fluidRow(
  box(
    dataTableOutput('userTable'),
    actionButton("do", 'save', icon = icon('redo')),
    width = 6
  )
)

# SERVER Part
server <- function(input, output, session){
  
  users <- reactive({fread("Editable_DT_data.csv")})

  output$userTable <- renderDataTable({
    DT::datatable(users(),
                    editable = list(target = 'cell', disable = list(columns = c(0:2))),
                  rownames = F)
  })
  

  edited <- reactive({editData(users(), input$userTable_cell_edit, proxy = NULL, rownames = FALSE, resetPaging = FALSE)})
  
  observeEvent(
    input$do,{
      req(!is.null(edited()))
      write.csv2(edited(),'Editable_DT_data.csv', row.names = FALSE)
    })
}

# Run app
shinyApp(ui = ui, server = server)
