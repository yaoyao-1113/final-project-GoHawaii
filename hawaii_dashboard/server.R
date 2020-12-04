server <- function(input, output) {
  
  pop <- reactive({
    filter(overview, County == input$county_filter)$Population
  })

  area <- reactive({
    filter(overview, County == input$county_filter)$Area
  })
  
  flower <- reactive({
    filter(overview, County == input$county_filter)$Flower
  })
  
  settle <- reactive({
    filter(overview, County == input$county_filter)$Largest_Settlement
  })
  
  output$progressBox1 <- renderValueBox({
    valueBox(
      pop(), 
      "Population", 
      icon = icon("users"),
      color = "aqua"
    )
  })

  output$progressBox2 <- renderValueBox({
    valueBox(
      area(), 
      "Area Sqr Fts", 
      icon = icon("home"),
      color = "purple"
    )
  })
  
  output$progressBox3 <- renderValueBox({
    valueBox(
      flower(), 
      "Official Flower", 
      icon = icon("fan"),
      color = "light-blue"
    )
  })
  
  output$progressBox4 <- renderValueBox({
    valueBox(
      settle(), 
      "Largest Settlement", 
      icon = icon("user"),
      color = "blue"
    )
  })
  
  output$dF_covid_table <- DT::renderDataTable(
    filter(covid, County == input$county_filter)
    
  )
  
  
}
