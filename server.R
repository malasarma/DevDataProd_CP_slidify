library(shiny)
library(UsingR)
data(anorexia)

postwt_pred <- function(prewt, treatment) {
        aov.out <- aov(Postwt ~ Treat + Prewt, data = anorexia)
        newdata <- data.frame(Treat = treatment, Prewt = prewt)
        post_wt <- predict(aov.out, newdata)
        return(round(post_wt, 2))
}
shinyServer(
        function(input, output) {
                output$inputPrewt <- renderPrint({input$Prewt})
                output$inputTreat <- renderPrint({input$Treat})
                output$prediction <- renderPrint({postwt_pred(input$Prewt, input$Treat)})
                output$gain <- renderPrint({postwt_pred(input$Prewt, input$Treat) - input$Prewt})
        }
)