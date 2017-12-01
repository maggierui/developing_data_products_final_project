#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
require(csv)
library(dplyr)

data<-read.csv("tech_ranking.csv",header=T)
data[,4]<-as.numeric(gsub("%|,","",data[,4]))

shinyServer(function(input, output) {
  output$table <- renderDataTable({
    rank_seq <- seq(from = input$rank[1], to = input$rank[2], by = 1)
    growth_seq <- seq(from = input$growth[1], to = input$growth[2], by = 1)
    
    data<-transmute(data,Rank=RANK,CompanyName=COMPANY.NAME,PrimaryIndustry=PRIMARY.INDUSTRY,Growth=GROWTH,City=CITY,StateProvince=PROV.,CEOname=CEO.NAME)
    data <- filter(data,Rank %in% rank_seq,Growth %in% growth_seq,StateProvince %in% input$state_province)
    data
  }, options = list(lengthMenu = c(5, 15, 30), pageLength = 30))
})