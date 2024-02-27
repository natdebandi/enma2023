


library(dplyr)
library(readr)

#rm(list = ls())

# Read the CSV file
enma <-  read_csv2("datos\\ENMA_v1.csv",col_names = TRUE,col_types = NULL)


# Display the structure of the data
str(enma)

##prueba pregunta q36_salud

##Las bases tienen dos columnas de calibración al final, 
#'weightvec': que calibra por variables sociodemograficas y corrige los pesos por nacionalidad
# y  'weightvec_0' que solo calibra las variables sociodemograficas al interior de cada nacionalidad
#, y mantiene el numero de n en la muestra para cada nacionalidad. 


consulta <- enma %>% 
  group_by(q36_salud) %>% 
  summarise (n = sum(weightvec)) %>%
  mutate(freq = n / sum(n) *100)


consulta


consulta <- enma %>% 
  group_by(Genero_i,edad_i) %>% 
  summarise (n = sum(pesos_para_estimaciones_totales)) %>%
  mutate(freq = n / sum(n) *100)


