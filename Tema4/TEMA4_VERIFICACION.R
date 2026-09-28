library(tidyverse)

df <- read_csv("C:/Users/Usuario/estudiantes.csv")


library(readr)
estudiantes <- read_csv("C:/Users/Usuario/estudiantes.csv")
View(estudiantes)

# Muestra estructura y valores faltantes por columna
glimpse(df)
colSums(is.na(df))


# Flujo de limpieza con el operador pipe
df_limpio <- df %>%
  drop_na(nota) %>%
  mutate(asistencia_pct = replace_na(asistencia_pct, mean(asistencia_pct, na.rm = TRUE)))

# Verificar que no queden valores faltantes (NA)
colSums(is.na(df_limpio))

# Agregación por grupo (estilo dplyr)
promedio_por_curso <- df_limpio %>%
  group_by(curso) %>%
  summarise(promedio_nota = mean(nota, na.rm = TRUE))

print(promedio_por_curso)

# Guarda el archivo limpio en R
write_csv(df_limpio, "estudiantes_limpio_R.csv")


