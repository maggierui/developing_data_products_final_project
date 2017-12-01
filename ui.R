#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(markdown)

shinyUI(navbarPage("Fastest Grown Tech Company in 2017 USA",
                   tabPanel("Home",
                            # Sidebar
                            sidebarLayout(
                              sidebarPanel(
                                helpText("Adjust the sliders and change the state/province to view companies by rank, growth percentage, and state/province."),
                                sliderInput('rank','select rank range:',min=1,max=500,value=c(1,500),step=1),
                                sliderInput('growth', 'Growth (in percentage):', min=135, max=60000, value=c(135,60000), step=1),
                                textInput('state_province', 'Abbreviation of a state or province', value = "GA", width = NULL, placeholder = NULL)

                              ),
                              mainPanel(
                                dataTableOutput('table')
                              )
                            )
                   ),
                   tabPanel("About",
                            mainPanel(
                              includeMarkdown("about.Rmd")
                            )
                   )
))   

