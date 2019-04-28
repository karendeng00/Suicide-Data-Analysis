#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
suicides <- read_csv("/cloud/project/data/master.csv")

ui <- fluidPage(
    
    # Sidebar layout with a input and output definitions
    sidebarLayout(
        
        # Inputs: Select variables to plot
        sidebarPanel(
            
            # Select country
            selectInput(inputId = "country_data",
                        label = "Country",
                        choices = suicides$country,
                        selected = "`Albania`"),
            
            # Select variable for x-axis
            selectInput(inputId = "x", 
                        label = "X-axis:",
                        choices = c("Year", "Sex", "Age", "Generation", "Population", "gdp_for_year",
                                    "gdp_per_capita", "HDI_for_year"),
                        selected = "Year"),
            
            # Select variable for y-axis
            selectInput(inputId = "y", 
                        label = "Y-axis:",
                        choices = c("suicides_no", "suicides_per_100k_pop"), 
                        selected = "suicides_per_100k_pop"),
            
            # Show data table
            checkboxInput(inputId = "show_data",
                          label = "Show Data: ",
                          value = FALSE)
        ),
        
        # Output
        mainPanel(
            
            # Show plot
            plotOutput(outputId = "plot"),
            
            # Show data table
            DT::dataTableOutput(outputId = "suicidetable")
        )
        
    )
)

# Define server function --------------------------------------------
server <- function(input, output) {
    
    # Create scatterplot object the plotOutput function is expecting
    output$plot <- renderPlot({
        
        if(input$x %in% c("Age", "Sex", "Generation")){
            ggplot(data = subset(suicides, country %in% input$country_data), 
                   aes_string(x = input$x, y = input$y)) +
                geom_boxplot()
        }
        
        else{
            ggplot(data = subset(suicides, country %in% input$country_data), 
                   aes_string(x = input$x, y = input$y)) +
                geom_smooth()
        }
    })
    
    # Print data table if checked
    output$suicidetable <- DT::renderDataTable(
        if(input$show_data){
            DT::datatable(data = subset(suicides, country %in% input$country_data), 
                          options = list(pageLength = 15), 
                          rownames = FALSE)
        }
    )
}

# Create the Shiny app object ---------------------------------------
shinyApp(ui, server)
