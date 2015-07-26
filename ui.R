library(shiny)
data("anorexia")
shinyUI(pageWithSidebar(
        headerPanel(em("WeightGain ShinyApp")),
        
        sidebarPanel(
              sliderInput("Prewt", "Slide to select Pre-Treatment Weight (lbs): ", 70, min = 70, max = 100, step = 0.5),
              selectInput("Treat", "Select the type of Treatment:",
                          list("Control (Cont)" = "Cont", 
                               "Cognitive Behavioral Treatment (CBT)" = "CBT",
                               "Family Treatment (FT)" = "FT")),
              submitButton('Submit')
        ),
        mainPanel(
                h4("Predict Weight Gain For Anorexic Women based on Treatment"),
                p("This ShinyApp reads the ", em("anorexia"), "dataset from the R packages."),
                code("'data.frame':	72 obs. of  3 variables:"),
                br(),
                code("$ Treat : Factor w/ 3 levels 'CBT','Cont','FT': 2 2 2 2 2 2 2 2 2 2 ..."),
                br(),
                code("$ Prewt : num  80.7 89.4 91.8 74 78.1 88.3 87.3 75.1 80.6 78.4 ..."),
                br(),
                code("$ Postwt: num  80.2 80.1 86.4 86.3 76.1 78.1 75.1 86.7 73.5 84.6 ..."),
                br(),
                p("Based on the", span("pre-Treatment weight", style = "color:blue"), " specified by the slider and the ", span("type of treatment", style = "color:blue"), "chosen, the app predicts the expected ", span("Post-Treatment weight", style = "color:blue"), "and ", span("Weight Gain", style = "color:blue"), "."),
                h3('Results of Prediction of Weight gain'),
                h4('Given a Pre-weight of (lbs):'),
                verbatimTextOutput("inputPrewt"),
                h4('and Treatment:'),
                verbatimTextOutput("inputTreat"),
                h4('Expected Post Treatment Weight (lbs):'),
                verbatimTextOutput("prediction"),
                h4('Expected Weight Gain (lbs):'),
                verbatimTextOutput("gain")
        )
))