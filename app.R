library(shiny)
dados = read.csv('slr12.csv', sep=';')
modelo = lm(CustoInicial ~ FranquiaAnual, data = dados)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Investimento inicial para abrir uma franquia"),

    fluidRow(
        column(4,
        h2('Valores'),
        tableOutput('Valores')
        ),
        column(8,
        plotOutput('Grafico')
        )
    ),
    fluidRow(
        column(6,
        h3("Valor anual da franquia"),
        numericInput("FranquiaAnual", "Insira o valor anual da franquia",0,min=1, max=99999999999),
        actionButton('Calcular', "Calcular")
        ),
        column(6,
        h1(textOutput("InvestimentoInicial"))
        )
    )
)
# Define server logic required to draw a histogram
server <- function(input, output) {
    output$Grafico = renderPlot({
        plot(CustoInicial ~ FranquiaAnual, data = dados)
        abline(modelo)
    })
    output$Valores = renderTable({head(dados,15)})
    observeEvent(input$Calcular, {
        valor = input$FranquiaAnual
        previsao = predict(modelo, data.frame(FranquiaAnual = eval(parse(text = valor))))
        previsao = paste0("Investimento Inicial de R$ ", round(previsao, 2))
        output$InvestimentoInicial = renderText({previsao})
    })
}
# Run the application 
shinyApp(ui = ui, server = server)
