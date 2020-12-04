

sidebar <- dashboardSidebar(
                            width = 260,
                            br(),
                            sidebarMenu(
                              menuItem(text = "Overview", 
                                       tabName = "Overview",
                                       icon = icon("compass")
                                       )
                            )
                            
)


# Dashboard Body ----------------------------------------------------------
body <- dashboardBody(
  tabItems(
    tabItem(
      tabName = "Overview",
      tabsetPanel(
        type = "tabs",
        tabPanel(
          title = "Hawaii",
          fluidRow(
            column (
              width = 8,
              valueBoxOutput("progressBox1", width = 5),
              valueBoxOutput("progressBox2", width = 5),
              valueBoxOutput("progressBox3", width = 5),
              valueBoxOutput("progressBox4", width = 5)
            ),

            sidebarPanel(
              h4("Please select which County you would like to see?", align = "center"),
              position = "right",
              hr(),
              selectInput(
                "county_filter",
                label = h3("Select box"),
                choices = mylist
              )
              
            )
            
          ),
          fluidRow(
            gradientBox(
              title = "General Description",
              icon = "fa fa-heart",
              gradientColor = "blue", 
              boxToolSize = "s", 
              footer = description,
              width = 12
            )
          ),
          fluidRow(
            box(
              status = "primary",
              title = "Covid Info",
              solid_header = TRUE,
              dataTableOutput("dF_covid_table"),
              width = 12
            )
          )
        )
      )
    )
  )
)
        


ui <- dashboardPage(
  includeCSS("styles.css"),
  header = dashboardHeader(title = "Go to Hawaii"),
  sidebar = sidebar,
  body = body
)