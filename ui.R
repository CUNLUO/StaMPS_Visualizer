########################
##setup user interface##
##StaMPS-Visualizer   ##
########################

#library packages
library(lubridate)
library(leaflet)

#prepare study site name
stusi <- substr(dirs[2:length(dirs)], 9, 50)

#setup navigation bar
navbarPage("StaMPS-Visualizer 2.0", id="nav",
           
           tabPanel("TS explorer",
                    div(class="outer",
                        
                        tags$head(
                          #include CSS
                          includeCSS("styles.css")
                        ),
                        leafletOutput("map", width="100%", height="100%"),
                        absolutePanel(id = "controls", class = "panel panel-default", fixed = T,
                                      draggable = TRUE, top = "auto", left = "auto", right = 20, bottom = 20,
                                      width = 900, height = 800,
                                      h2("Single TS selection"),
                                      fluidRow(column(6,
                                                      selectInput("stusi", "Case Study", stusi,
                                                                  selected = stusi[1], width = "500px")),
                                               column(6,
                                                      dateInput('date',
                                                                label = 'Date of event',
                                                                value = '2017-06-24'#Sys.Date()
                                                      ))),
                                      plotOutput("psts", height = 600, width = 800),
                                      fluidRow(verbatimTextOutput("Click_text"))
                        )
                    )
            ),
           
           tabPanel("TS Comparison",
                    fluidRow(column(4,
                                    selectInput("stusitsc", "Case Study", stusi, selected = stusi[1])),
                             column(4,
                    uiOutput("ts1")),
                            column(4,
                    uiOutput("ts2")),
                            column(4,
                    uiOutput("ts3")),
                            column(4,
                    uiOutput("ts4")),
                            column(4,
                    uiOutput("ts5")),
                    column(4,
                           dateInput('datesc',
                                     label = 'Date of event',
                                     value = Sys.Date()
                           ))
                    ),
                    plotOutput("tscomp", height = 750)),
           
            tabPanel("Manual",
                       fluidPage(
                       includeHTML("manual.html"))),
            tabPanel("Cite",
                        fluidPage(
                        includeHTML("impressum.html")))

)