# Mortalidade materna no Ceará cresce 59% depois de três anos em queda
A reportagem ["Mortalidade materna no Ceará cresce 59% depois de três anos em queda"](https://mais.opovo.com.br/jornal/reportagem/2022/08/22/mortalidade-materna-no-ceara-cresce-59-depois-de-tres-anos-em-queda.html) traça um perfil dos óbitos maternos no Ceará, e descortina as razões desse tipo de morte ainda  persistir no Estado. Entender como e onde esse óbito ocorre, a situação e qual a população mais atingida é fundamental para pressionar o governo por políticas públicas mais eficazes, ao mesmo tempo que revela as fragilidades no sistema de atendimento.

![](https://i.imgur.com/MhieN3V.jpg)

---

## Fontes e coleta de dados
Este material foi com base nos dados do Sistema de Informações sobre Mortalidade (SIM/DATASUS) e Boletins epidemiológicos sobre mortalidade materna no Ceará. Os dados disponibilizados pelo DATASUS, específicos sobre óbitos maternos estavam em formato DBC, portanto para leitura e tratamento foi utilizada a linguagem R. Os arquivos do Estado estavam em PDF. 

* [Sistema de Informações sobre Mortalidade (SIM/DATASUS)](https://datasus.saude.gov.br/mortalidade-desde-1996-pela-cid-10)
* [Boletim de Mortalidade Materna do Governo do Estado do Ceará](https://www.saude.ce.gov.br/wp-content/uploads/sites/9/2018/06/boletim_epidemiologico_mortalidade_materna_n1_25112020.pdf) 

---

## Metodologia

Para esta reportagem fizemos uma análise exploratória dos dados para descobrir os perfis das vítimas.

---
## Arquivos

### Utilizados

Os dados originais utilizados para a análise estão disponibilizados na pasta `Bases originais`. 

### Código

É possível fazer o download do código criado em linguagem R para tratar a base na pasta `Código`.

### Gerados

Os arquivos gerados a partir da análise realizada estão disponíveis na pasta `Bases limpas`.

***Dataframes***

* `morte_materna_geral.csv`: Nesta base estão dados sobre Mortalidade Materna de 2.626 municípios brasileiros, de 2015 a 2020.  Nela você poderá encontrar 18 variáveis, que podem traçar um perfil das vítimas em cada cidade.

***Visualizações***

* [Evolução da Razão de mortalidade materna no Ceará - 2015 a 2020](https://public.flourish.studio/visualisation/10807597/)
* [Óbitos maternos dos 10 municípios com maiores valores absolutos](https://public.flourish.studio/visualisation/10807840/)
* [Mortes maternas segundo momento de ocorrência do óbito](https://public.flourish.studio/visualisation/10806583/)
* [Óbitos maternos por escolaridade no Ceará](https://public.flourish.studio/visualisation/10807164/)
* [Óbitos maternos por raça no Ceará](https://public.flourish.studio/visualisation/10807459/)
* [Mulheres entre 28 e 37 anos correspondem a 45% dos óbitos maternos no CE](https://public.flourish.studio/visualisation/10801902/)

---

## A Central DATADOC

A Central de Jornalismo de Dados do O POVO (DATADOC) alia tecnologia e técnicas diversas de análises de dados para produzir um jornalismo de precisão para que você forme sua opinião com segurança. Nosso objetivo é fazer com que todos tenham acesso aos dados utilizados nas notícias que produzimos.

A DATADOC é composta por uma equipe de três jornalistas (sendo uma infografista), uma desenvolvedora front-end e um cientista da computação que coletam, enriquecem e disponibilizam as bases e códigos de cada reportagem para um jornalismo transparente e baseado em evidências.

---

**🔥📰👩🏻‍💻 Se você gostou do nosso material, apoie assinando o OP+ e acompanhando o nosso trabalho.**

**📝📨 Para feedback, dúvidas ou sugestões: datadoc@opovodigital.com**

---

🗓️🕵🏻 Confira também outras produções recentes da central DATADOC: A matéria ***Gilberto Gil 80 anos: uma viagem pelas composições e parcerias do baiano*** análises de composições e dados sobre as músicas do artista no YouTube e no Spotify. [Confira no **O POVO**](https://www.opovo.com.br/vidaearte/2022/06/24/gilberto-gil-80-anos-uma-viagem-pelas-composicoes-e-parcerias-do-baiano.html).