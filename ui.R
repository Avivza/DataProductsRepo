library(shiny)
shinyUI(fluidPage(
        headerPanel("Ecosystem Simolator"),
        sidebarPanel(width = 4,
                h3("Population's Characteristics:"),
                numericInput("pred",label="Predator Population Size",10,min=10,max=100000,step=1),
                sliderInput("pred_eff",label="Predator Effiecincy",0.01,min=0,max=0.1,step=0.01),
                
                numericInput("herb",label="Herbivor Population Size",10,min=10,max=100000,step=1),
                sliderInput("herb_eff",label="Herbivor Effiecincy",0.1,min=0,max=0.1,step=0.01),
                
                numericInput("grass",label="Grass Biomass",10,min=10,max=100000,step=1),
                actionButton("goButton", "Go!")
        ),
        mainPanel(
                h3("This App simulates the relatioship between three trophic levels: Predator, 
                   Herbivor and grass. The predator feeds on the Herbivor, which in turn feeds
                   on grass.   The feeding efficincies of the predator and the herbivor, and 
                   inital population sizes of all three trophic levels are determined by you 
                   is determined by you."),
                h3(" Insert you requested factors, push 'Go'and see what happens to you ecosystem 
                     over the first 100 years, or less if any of the populations is extinct."),
                h3("Try it now!"),
                fluidRow(), 
                fluidRow(),              
                fluidRow(),                              
                h2("Populations size over first generations"),
                plotOutput("graph")
        )
))

