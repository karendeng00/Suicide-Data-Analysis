# Load packages -----------------------------------------------------
library(tidyverse)
library(ggplot2)

# Load data ---------------------------------------------------------
masterdata <- read_csv("/cloud/project/data/master.csv")

# Define UI ---------------------------------------------------------
ui <- fluidPage(
    
    # Sidebar layout with a input and output definitions
    sidebarLayout(
        
        # Inputs: Select variables to plot
        sidebarPanel(
            
            # Select variable for y-axis
            selectInput(inputId = "y", 
                        label = "Y-axis:",
                        choices = c("suicides_no", "suicides/100k pop"), 
                        selected = "suicides_no"),
            
            # Select variable for x-axis
            selectInput(inputId = "x", 
                        label = "X-axis:",
                        choices = c("country", "year", "sex", "age", "population", "country-year", "HDI for year"), 
                        selected = "country"),
            
            # Select variable for color
            #selectInput(inputId = "z", 
                  #      label = "Color by:",
                     #   choices = c("country", "year", "sex", "age", "population", "country-year", "HDI for year"),
                     #   selected = "country"),
            
            # Set alpha level
            sliderInput(inputId = "alpha", 
                        label = "Alpha:", 
                        min = 0, max = 1, 
                        value = 0.5),
            
            # Show data table
            checkboxInput(inputId = "show_data",
                          label = "Show Data: ",
                          value = FALSE
            )
        ),
        
        # Output
        mainPanel(
            
            # Show scatterplot
            plotOutput(outputId = "scatterplot"),
            
            # Show data table
            DT::dataTableOutput(outputId = "suicidetable")
            
        )
    )
)

# Define server function --------------------------------------------
server <- function(input, output) {
    
    # Create scatterplot object the plotOutput function is expecting
    output$scatterplot <- renderPlot({
        ggplot(data = masterdata, aes_string(x = input$x, y = input$y)) +
            geom_point(alpha = input$alpha)
    })
    
    # Print data table if checked
    output$suicidetable <- DT::renderDataTable(
        if(input$show_data){
            DT::datatable(data = suicides, 
                          options = list(pageLength = 15), 
                          rownames = FALSE)
        }
    )
}

# Create the Shiny app object ---------------------------------------
shinyApp(ui, server)

