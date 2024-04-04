


#recodifico edad en 3 grupos

enma<-enma %>% 
  mutate(edad_2020= case_when(
    q2_edad< 35 ~ "18-34",
    q2_edad> 34 & q2_edad<55 ~ "35-54",
    TRUE ~ "55+"))



enma<-enma %>% 
  mutate(anio_llegada_var= case_when(
    q13_anio_llegada >= 2021 ~ ">= 2021",
    (q13_anio_llegada >= 2016 & q13_anio_llegada <= 2020) ~ "Entre 2016 y 2020",
    (q13_anio_llegada >= 2011 & q13_anio_llegada <= 2015) ~ "Entre 2011 y 2015",
    (q13_anio_llegada >= 2006 & q13_anio_llegada <= 2010) ~ "Entre 2006 y 2010 ",
    (q13_anio_llegada >= 2001 & q13_anio_llegada <= 2005) ~ "Entre 2001 y 2005 ",
    (q13_anio_llegada < 2001 ) ~ "< 2001 ",
    TRUE ~ NA))


#se quere calcular una variable de tiempo de residencia de más rango para compara con 2020
# hasta 1 año : llegó en 2022 o 2023 (la encuesta fue en mayo)
# Más de 1 año y menos de 2 años : entre 2020 y 2021
# 3-5 años : entre 2017, 2018 y 2019 
# 5 y 9  : 2016 y 2012
# más de 10 años.Antes de 2013

##tomamos 1 año desde 2022 inclusive ya que se aplicó en mayo

enma<- enma %>% 
  mutate(tiempo_reciente_5=case_when(
    q13_anio_llegada>=2022~ "hasta 1 año (2022+)",
    q13_anio_llegada>=2020 & q13_anio_llegada <=2021 ~ "Más de 1 año y hasta 2 años (2020-2021)",
    q13_anio_llegada>=2017 & q13_anio_llegada <=2019 ~ "3-5 años (2017-2019)",
    q13_anio_llegada>=2012 & q13_anio_llegada <=2016 ~ "6-9 años (2012-2016)",
    q13_anio_llegada<=2011 ~ "más de 10 años (<=2011)",
  )
  )



#Recodifico nivel educativo en tres categorías:

# 1) Hasta secundario incompleto
# 2) Secundario completo (incluye terciario y universitario incompleto)
# 3) Superior completo y más


enma<-enma %>% 
  mutate(niveled=case_when(
    q46_estudios=="Primario completo" | q46_estudios=="Secundario incompleto o en curso" | q46_estudios=="Primario incompleto o en curso" ~ "Hasta secundario incompleto",
    q46_estudios=="Secundario completo" | q46_estudios=="Terciario incompleto o en curso" | q46_estudios=="Universitario incompleto o en curso" ~ "Secundario completo",
    q46_estudios=="Universitario completo" | q46_estudios=="Terciario completo"~ "Superior completo y más",
    TRUE ~  NA
  ))
