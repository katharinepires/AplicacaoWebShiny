# Apliçãcao Web Shiny
Aplicação Web usando Shiny, pacote do R
Fazendo um aplicação Web sobre os custos de abrir uma franquia levando em consideração a taxa anual da franquia. Como refrência de valores, foram utlizados como fonte dos dados o *Business Opportunity Handbook*. 

Nesse exemplo, temos o problema de saber qual será valor inicial de investimento para a abertura de uma franquia. 
A ideia é: 
## A partir da taxa anual cobrada, dá para calcular o investimento inicial?

A tecnica utilizada será a de Regressão Linear simples pois é a previsão de um valor numérico. 
Temos a ***variável dependente (**Y**): Investimento Inicial*** e a ***variável independente (**X**): Valor Anual da Franquia***.

Será criado um modelo onde a variavel de resposta (Y), será dada através dos dados históricos, que irão servir como base para nossa previsão. 
Será necessário:
- Instalar o Pacote Shiny no R:
```
install.packages("shiny", dependencies = T)
```
- Abrir o Shiny Web App: File -> New File -> Shiny Web App...
- Fazer o carregamento dos dados
- Criar o modelo e função para calcular o valor
```
modelo = lm(CustoInicial ~ FranquiaAnual, data = dados)
previsao = predict(modelo, data.frame(FranquiaAnual = eval(parse(text = valor))))
```
[Acesse o site aqui](https://katharinepires.shinyapps.io/InvestimentoInicial/)
[Katharine Pires](https://www.linkedin.com/in/katharine-pires-53b849155/)
