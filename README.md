# Projeto_Análise_de_Churn-

O Projeto visa a integração de duas ferramentas, entre elas o SQL para ETL e o Power BI para a demonstração (Dashbord), onde tambpem foi realizado consultas DAX e a modelagem de dados.
____________________________________________________________________________________________________________________________________________________________________

Resolução:

Objetivo da Análise: Análise de Churn ( entender quem sai e por qual motivo), analisar tendências e pradões entre o principal perfil de cliente.

____________________________________________________________________________________________________________________________________________________________________

 🗂️ 1ª Etapa - Com a base de dados em mãos a primeira etapa foi entender as variavéis e a extensão da base de dados separando as variavéis de Fato x Dimensão, sendo:
dimensões:

 - customer id
 - full name
 - date of purchase
 - age
 - State
 - MTN
 - gender
 - Customer Review
 - Data Usage
 - Number of Times Purchased
 - Subscription Plan
 
Fato
 - Satisfaction Rate
 - Customer Tenure in months
 - Total Revenue
 - Customer Churn Status
____________________________________________________________________________________________________________________________________________________________________

⚒️ 2ª Etapa - Na segunda etapa foi realizado o cruzamento entre as variavéis Fatos e Dimensões,  onde foi gerado as seguintes perguntas de negócio para investigar os dados e extrair os insights:

 CONCLUSÃO: PERGUNTAS A MANTER (INSIGHTS ACIONÁVEIS)

🧩 Idade

 - Qual a faixa etária com maior rotatividade?

 - Qual a faixa etária com menor permanência?

🌍 Estado

 - Quais os estados com maior rotatividade?

 - Quais os estados com menor rotatividade?

📱 Serviço

 - Qual o dispositivo com maior rotatividade?

 - Qual o dispositivo com menor retenção?

👤 Gênero

 - Qual gênero apresenta maior rotatividade?

 - Qual gênero apresenta maior tempo de permanência?

📊 Satisfação

 - Qual avaliação está mais associada ao churn?

 - Clientes menos satisfeitos permanecem menos?

🔁 Frequência de Compra

 - Compradores permanecem mais?

 - Compradores eventualmente têm maior rotatividade?

📦 Plano

 - Quais planos têm maior rotatividade?

 - Quais planos têm maior tempo médio de permanência?

🎯 Motivos e Localidades

 - Quais são os principais motivos que levam o cliente a deixar de consumir os produtos?

 - Em quais localidades esses motivos são mais prevalentes?

   _________________________________________________________________________________________________________________________________________________________________

   3º Etapa - Tratar os dados (Tratamento.sql)  e investigar os dados para responder as perguntas (Projeto.sql).


📌 Insight Final sobre Churn

A análise comparativa é que os clientes com maior tendência de rotatividade possuem perfil de baixa idade de contrato , menor valor gasto mensalmente e menor engajamento com os serviços . Em sua maioria, são clientes que contrataram planos básicos e que demonstraram insatisfação precoce.

Os principais motivos de saídas detectadas foram:

Preço percebido como elevado em comparação ao valor entregue;

Problemas de infraestrutura (rede ou atendimento);

Falta de benefícios ou diferenciação nos planos mais básicos.

🔎 Conclusão Estratégica:
Para reduzir a taxa de rotatividade, é necessário reavaliar os planos de entrada (melhorando benefícios e competitividade de preço), investir em melhorias estruturais nos serviços e criar estratégias de engajamento no início da jornada do cliente, quando o risco de cancelamento é mais alto.

___________________________________________________________________________________________________________________________________________________________________

4ª Etapa - Foi realizado a importação e o tratamento da base de dados (Power Pivot), não foi encontrado valores nulos devido ao tratamento em SQL, também foi incluido e segmentado a coluna de data para identificar os messes.

 - Após o tratamento foi inserido as seguintes consultas Dax:

 - Churn por Frequência de Compra = 
CALCULATE(COUNTROWS(client_churn), client_churn[Customer Churn Status] = "Yes", client_churn[Number of Times Purchased])

Churn por Gênero = 
CALCULATE(COUNTROWS(client_churn), client_churn[Customer Churn Status] = "Yes")

Clientes_Ativos = COUNTROWS(FILTER(client_churn, client_churn[Customer Churn Status] = "No"))

Clientes_Inativos = COUNTROWS(FILTER(client_churn, client_churn[Customer Churn Status] = "Yes"))

taxa_churn = DIVIDE(COUNTROWS(FILTER(client_churn, client_churn[Customer Churn Status] = "Yes")), COUNTROWS(client_churn))

- Projeto_sql: Possui as principais perguntas para investigar os dados e o script de resolução em (SQL).

___________________________________________________________________________________________________________________________________________________________________
  
  5ª Etapa - - Elaboração dos Dashbords para exibir os principais fatores do objetivo. 

  - Arquivo (projeto_churn.pbix)
  
