# Load packages ----
library(tidyverse)
library(shiny)
library(plotly)
library(lubridate)
library(crosstalk)
library(shinythemes)
library(crosstalk)

# Load data ---- 
df_mo_prop <- read_csv("data/data.csv")



# User interface ----
ui <- fluidPage(
    theme = shinytheme("flatly"),
    titlePanel("Analyzing Anime data"),
    sidebarLayout(
        sidebarPanel(
            h2(strong(code("How to navigate:", br("Click on Source in the legend to make it disappear"))))
            

            
            
        ),
    mainPanel(plotlyOutput("plot",1250,800)
              
              
              
              
              
              )))



# Server logic ----

server <- function(input, output){
    
    output$plot <- renderPlotly({ 
               
 
        
        df_mo_prop %>%
                    plot_ly(x=~factor(year),y=~prop*100,name = ~source, color = ~source,colors=c(
                       "#F1E116","#E7D783","#B8A43D", "#481186","#5364B4",
                        "#D17798","#279EAE","#F47949","#A0355D","#C7420E",
                        "#381B1D","#DFCB62","#147397","#CF3E93","#614D99")   )%>%
                    add_bars() %>% 
                    layout(title = "TV Anime Source Material %",titlefont =list(size=18),
                           barmode = 'stack',
                           legend = list(x = 100, y = 0.5),
                           xaxis = list(title ="Year",titlefont =list(size=17)),
                           yaxis = list(title = "Percentage",ticksuffix = "%",titlefont =list(size=20)) )%>% 
        rangeslider(thickness = 0.08,start = 1999, end = 2019 )
        
    })
}


# Run the application 
shinyApp(ui = ui, server = server)