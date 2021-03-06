source("PredictNextWord.R")

shinyServer(
    function(input, output) {
        # get bigram and discount rates once and use them in multiple
        # reactive functions to build multiple objects/observers
        useCorpus <- eventReactive(input$predictButton,
                                   {as.integer(input$corpusToUse)})
        inBigram <- eventReactive(input$predictButton,
                                  {getInputBigram(input$phrase)})
        bigDisc <- eventReactive(input$predictButton,
                            {as.numeric(input$bigDiscount)})
        trigDisc <- eventReactive(input$predictButton,
                                  {as.numeric(input$trigDiscount)})
        probBars <- eventReactive(input$predictButton,
                                  {as.integer(input$histBars)})
        
        topPreds <- eventReactive(input$predictButton,
                                  {getTopNPredictions(inBigram(), probBars(), 
                                                      useCorpus(),
                                                      bigDisc(), trigDisc())})
        
        output$sPredictionSettings <-
            renderPrint({getSettings(useCorpus(), bigDisc(), trigDisc())})
        
        output$sInputBigram <- renderPrint(inBigram())
        
        output$sPredictedWord <- renderPrint({getPrediction(topPreds())})
        
        output$sPredictedFrom <- renderPrint({getPredictFrom()})
        
        output$pTop3Probs <- renderPlot({
            getPlot(topPreds()$ngram, topPreds()$prob)
        })
        
    }
)