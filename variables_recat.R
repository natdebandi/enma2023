


#recodifico edad en 3 grupos

enma<-enma %>% 
  mutate(edad_2020= case_when(
    q2_edad< 35 ~ "18-34",
    q2_edad> 34 & q2_edad<55 ~ "35-54",
    TRUE ~ "55+"))
