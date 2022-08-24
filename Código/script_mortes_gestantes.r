#Projeto de reportagem sobre Mortes maternas 
#Os arquivos foram  extraídos do SIM/ DATASUS

#Para limpar os dados e analisá-los, utilizaremos o Tidyverse
install.packages("tidyverse")
library(tidyverse)

#Os arquivos disponibilizados no SIM estão em formato .dbc
#Então vamos instalar o pacote abaixo para leitura 
install.packages("read.dbc")
library(read.dbc)

#Agora vamos puxar cada arquivo de 2016 a 2020
#Criaremos um objeto para cada arquivo 
morte_15 <- read.dbc("DOMAT15.DBC")
morte_16 <- read.dbc("DOMAT16.DBC")
morte_17 <- read.dbc("DOMAT17.DBC")
morte_18 <- read.dbc("DOMAT18.DBC")
morte_19 <- read.dbc("DOMAT19.dbc")
morte_20 <- read.dbc("DOMAT20.dbc")

#Vamos deixar apenas as colunas de interesse
#Aplicaremos a função TRANSMUTE para deixar somente o que interessa

morte_nova_20 <- transmute(morte_20,
                         IDADE, RACACOR,
                        ESTCIV, ESC,LOCOCOR, ESC, ESC2010, OCUP, CODMUNRES, TPMORTEOCO, OBITOGRAV, ASSISTMED, LINHAA, CAUSABAS, NECROPSIA)

morte_nova_19 <- transmute(morte_19,
                           IDADE, RACACOR,
                           ESTCIV, ESC,LOCOCOR, ESC, ESC2010, OCUP, CODMUNRES, TPMORTEOCO, OBITOGRAV, ASSISTMED, LINHAA, CAUSABAS, NECROPSIA)

morte_nova_18 <- transmute(morte_18,
                           IDADE, RACACOR,
                           ESTCIV, ESC,LOCOCOR, ESC, ESC2010, OCUP, CODMUNRES, TPMORTEOCO, OBITOGRAV, ASSISTMED, LINHAA, CAUSABAS, NECROPSIA)

morte_nova_17 <- transmute(morte_17,
                           IDADE, RACACOR,
                           ESTCIV, ESC,LOCOCOR, ESC, ESC2010, OCUP, CODMUNRES, TPMORTEOCO, OBITOGRAV, ASSISTMED, LINHAA, CAUSABAS, NECROPSIA)

morte_nova_16 <- transmute(morte_16,
                           IDADE, RACACOR,
                           ESTCIV, ESC,LOCOCOR, ESC, ESC2010, OCUP, CODMUNRES, TPMORTEOCO, OBITOGRAV, ASSISTMED, LINHAA, CAUSABAS, NECROPSIA)

morte_nova_15 <- transmute(morte_15,
                           IDADE, RACACOR,
                           ESTCIV, ESC,LOCOCOR, ESC, ESC2010, OCUP, CODMUNRES, TPMORTEOCO, OBITOGRAV, ASSISTMED, LINHAA, CAUSABAS, NECROPSIA)

#Agora iremos inserir os respectivos anos em cada base

ano <- c(2020)
morte_nova_20_inclui <- mutate(morte_nova_20, ano)

ano <- c(2019)
morte_nova_19_inclui <- mutate(morte_nova_19, ano)

ano <- c(2018)
morte_nova_18_inclui <- mutate(morte_nova_18, ano)

ano <- c(2017)
morte_nova_17_inclui <- mutate(morte_nova_17, ano)

ano <- c(2016)
morte_nova_16_inclui <- mutate(morte_nova_16, ano)

ano <- c(2015)
morte_nova_15_inclui <- mutate(morte_nova_15, ano)

#Combinando todos os dataset acima com a Função BIND
#Uso essa função pois as variáveis estão na mesma ordem 

morte_nova_geral <- bind_rows(morte_nova_15_inclui, morte_nova_16_inclui, morte_nova_17_inclui, morte_nova_18_inclui, morte_nova_19_inclui, morte_nova_20_inclui)

#Verificando a base
dim(morte_nova_geral)
names(morte_nova_geral)
head(morte_nova_geral)
summary(morte_nova_geral)
str(morte_nova_geral)

#Exportando a base para um csv 

write.csv(morte_nova_geral, file = "obitos_maternos.csv")

#Puxando a base em CSV

morte_materna<- read.csv("obitos_maternos.csv", 
                            header = TRUE, 
                            sep = ",",
                            dec = ".")
#Verificando a base morte_materna
dim(morte_materna)
names(morte_materna)
head(morte_materna)
summary(morte_materna)
str(morte_materna)

#Puxando a base csv do códigos do municípios

cod_mun<- read.csv("cod_mun_ibge_6_e_7_digitos.csv", 
                   header = TRUE, 
                   sep = ",",
                   dec = ".")

#Precisamos unir as bases para ter o nome dos municípios
#Para isso vamos padronizar a variável chave

cod_mun <- cod_mun %>% rename(codmun=IBGE)
morte_materna <- morte_materna %>% rename(codmun=CODMUNRES)

#Realizando a união das bases

morte_materna_uniao <- left_join(cod_mun, morte_materna,
                                 by = "codmun")

view(morte_materna_uniao)

#Mudando o conteúdo das variáveis - Mutate e Replace

morte_materna_geral <- mutate(morte_materna_uniao, 
                       RACACOR = replace(RACACOR, RACACOR==1, "BRANCA"),
                       RACACOR = replace(RACACOR, RACACOR==2, "PRETA"),
                       RACACOR = replace(RACACOR, RACACOR==3, "AMARELA"),
                       RACACOR = replace(RACACOR, RACACOR==4, "PARDA"),
                       RACACOR = replace(RACACOR, RACACOR==5, "INDIGENA"),
                       ESTCIV = replace(ESTCIV, ESTCIV==1, "SOLTEIRA"),
                       ESTCIV = replace(ESTCIV, ESTCIV==2, "CASADA"),
                       ESTCIV = replace(ESTCIV, ESTCIV==3, "VIUVA"),
                       ESTCIV = replace(ESTCIV, ESTCIV==4, "DIVORCIADA"),
                       ESTCIV = replace(ESTCIV, ESTCIV==5, "UNIAO ESTAVEL"),
                       ESTCIV = replace(ESTCIV, ESTCIV==9, "IGNORADO"),
                       TPMORTEOCO = replace(TPMORTEOCO, TPMORTEOCO==1, "NA GRAVIDEZ"),
                       TPMORTEOCO = replace(TPMORTEOCO, TPMORTEOCO==2, "NO PARTO"),
                       TPMORTEOCO = replace(TPMORTEOCO, TPMORTEOCO==3, "NO ABORTAMENTO"),
                       TPMORTEOCO = replace(TPMORTEOCO, TPMORTEOCO==4, "ATE_42_POS_PARTO"),
                       TPMORTEOCO = replace(TPMORTEOCO, TPMORTEOCO==5, "DE_43_DIAS_UM_ANO"),
                       TPMORTEOCO = replace(TPMORTEOCO, TPMORTEOCO==8, "NAO OCORREU NESTES PERIODOS"),
                       TPMORTEOCO = replace(TPMORTEOCO, TPMORTEOCO==9, "IGNORADO"),
                       LOCOCOR = replace(LOCOCOR, LOCOCOR==1, "HOSPITAL"),
                       LOCOCOR = replace(LOCOCOR, LOCOCOR==2, "OUTROS ESTABELECIMENTOS DE SAUDE"),
                       LOCOCOR = replace(LOCOCOR, LOCOCOR==3, "DOMICILIO"),
                       LOCOCOR = replace(LOCOCOR, LOCOCOR==4, "VIA PUBLICA"),
                       LOCOCOR = replace(LOCOCOR, LOCOCOR==5, "OUTROS"),
                       LOCOCOR = replace(LOCOCOR, LOCOCOR==6, "ALDEIA INDIGENA"),
                       LOCOCOR = replace(LOCOCOR, LOCOCOR==9, "IGNORADO"),
                       ESC2010 = replace(ESC2010, ESC2010 == 0, "SEM ESCOLARIDADE"),
                       ESC2010 = replace(ESC2010, ESC2010 == 1, "FUNDAMENTAL 1 "),
                       ESC2010 = replace(ESC2010, ESC2010 == 2, "FUNDAMENTAL 2"),
                       ESC2010 = replace(ESC2010, ESC2010 == 3, "MEDIO"),
                       ESC2010 = replace(ESC2010, ESC2010 == 4, "SUPERIOR INCOMPLETO"),
                       ESC2010 = replace(ESC2010, ESC2010 == 5, "SUPERIOR COMPLETO"),
                       ESC2010 = replace(ESC2010, ESC2010 == 9, "IGNORADO"),
                       OBITOGRAV = replace(OBITOGRAV, OBITOGRAV == 1, "SIM"),
                       OBITOGRAV = replace(OBITOGRAV, OBITOGRAV == 2, "NAO"),
                       OBITOGRAV = replace(OBITOGRAV, OBITOGRAV == 9, "IGNORADO"),
                       NECROPSIA = replace(NECROPSIA, NECROPSIA == 1, "SIM"),
                       NECROPSIA = replace(NECROPSIA, NECROPSIA == 2, "NAO"),
                       NECROPSIA = replace(NECROPSIA, NECROPSIA == 9, "IGNORADO"),
                       ESC = replace(ESC, ESC == 1, "NENHUMA"),
                       ESC = replace(ESC, ESC == 2, "DE 1 A 3 ANOS"),
                       ESC = replace(ESC, ESC == 3, "DE 4 A 7 ANOS"),
                       ESC = replace(ESC, ESC == 4, "DE 8 A 11 ANOS"),
                       ESC = replace(ESC, ESC == 5, "12 ANOS E MAIS"),
                       ESC = replace(ESC, ESC == 9, "IGNORADO"),
                       ASSISTMED = replace(ASSISTMED, ASSISTMED == 1, "SIM"),
                       ASSISTMED = replace(ASSISTMED, ASSISTMED == 2, "NAO"),
                       ASSISTMED = replace(ASSISTMED, ASSISTMED == 9, "IGNORADO"))

#Exportando a base para um csv 

write.csv(morte_materna_geral, file = "morte_materna_geral.csv")

morte_materna_final<- read.csv("Mortalidade_Geral_2020.csv", 
                            header = TRUE, 
                            sep = ";",
                            dec = ".")

#TRABALHANDO OS DADOS DOS NASCIDOS VIVOS PARA PODER TER TMM

nascvivo_15 <- read.csv("SINASC_2015.csv", 
                        header = TRUE, 
                        sep = ";",
                        dec = ".")

nascvivo_16 <- read.csv("SINASC_2016.csv", 
                        header = TRUE, 
                        sep = ";",
                        dec = ".")

nascvivo_17 <- read.csv("SINASC_2017.csv", 
                        header = TRUE, 
                        sep = ";",
                        dec = ".")

nascvivo_18 <- read.csv("SINASC_2018.csv", 
                        header = TRUE, 
                        sep = ";",
                        dec = ".")

nascvivo_19 <- read.csv("SINASC_2019.csv", 
                        header = TRUE, 
                        sep = ";",
                        dec = ".")

nascvivo_20 <- read.csv("SINASC_2020.csv", 
                        header = TRUE, 
                        sep = ";",
                        dec = ".")
