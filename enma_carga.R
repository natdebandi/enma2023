

# Install and load the necessary packages if not already installed
# install.packages("dplyr")
# install.packages("readr")
library(dplyr)
library(readr)

#rm(list = ls())

# Read the CSV file
enma <-  read_csv2("datos\\ENMA_v1.csv",col_names = TRUE,col_types = NULL)


# Display the structure of the data
str(enma)

# Example: Create a grouped variable based on an existing variable
# Replace "existing_variable" with the name of the variable you want to group by
consulta <- data %>% 
  group_by(Genero_i,edad_i) %>% 
  summarise (n = sum(pesos_para_estimaciones_totales)) %>%
  mutate(freq = n / sum(n) *100)

# Display the modified data
consulta



