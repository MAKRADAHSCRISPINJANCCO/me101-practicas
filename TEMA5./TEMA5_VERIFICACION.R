library(tidyverse)
library(e1071)
library(readr)
estudiantes_limpio_1_ <- read_csv("C:/Users/Usuario/Downloads/estudiantes_limpio (1).xls")
View(estudiantes_limpio_1_)

df <- read_csv("C:/Users/Usuario/Downloads/estudiantes_limpio (1).xls")

# ---- Estadísticos básicos de nota ----
media    <- mean(df$nota)
mediana  <- median(df$nota)
desv     <- sd(df$nota)                       
varianza <- var(df$nota)                      
q1  <- unname(quantile(df$nota, 0.25))
q3  <- unname(quantile(df$nota, 0.75))
iqr <- IQR(df$nota)

tabla1 <- data.frame(
  Estadistico = c("Media", "Mediana", "Desv. std (sd)", "Varianza (var)",
                  "Q1", "Q3", "IQR"),
  Valor = round(c(media, mediana, desv, varianza, q1, q3, iqr), 4)
)

cat("=== ESTADISTICOS DE 'nota' ===\n")
print(tabla1, row.names = FALSE)



tabla2 <- data.frame(
  Medida = c("Skewness", "Kurtosis"),
  e1071  = round(c(skewness(df$nota), kurtosis(df$nota)), 4)
)

cat("\n=== FORMA DE LA DISTRIBUCION DE 'nota' ===\n")
print(tabla2, row.names = FALSE)



resumen_estadistico <- function(vector, decimales = 4) {
  n        <- sum(!is.na(vector))
  media    <- mean(vector, na.rm = TRUE)
  mediana  <- median(vector, na.rm = TRUE)
  desv_std <- sd(vector, na.rm = TRUE)
  cv_pct   <- desv_std / media * 100
  list(
    n        = n,
    media    = round(media, decimales),
    mediana  = round(mediana, decimales),
    desv_std = round(desv_std, decimales),
    cv_pct   = round(cv_pct, decimales)
  )
}

cat("\n=== RESUMEN DE 'nota' ===\n")
print(as.data.frame(resumen_estadistico(df$nota)), row.names = FALSE)







clasificar_dispersion <- function(cv_pct) {
  if (cv_pct < 15) {
    "Baja"
  } else if (cv_pct < 30) {
    "Moderada"
  } else {
    "Alta"
  }
}

# ---- Bucle for sobre las dos columnas ----
tabla4 <- data.frame()
for (columna in c("nota", "asistencia_pct")) {
  resumen <- resumen_estadistico(df[[columna]])
  fila <- data.frame(
    columna    = columna,
    n          = resumen$n,
    media      = resumen$media,
    mediana    = resumen$mediana,
    desv_std   = resumen$desv_std,
    cv_pct     = resumen$cv_pct,
    dispersion = clasificar_dispersion(resumen$cv_pct)
  )
  tabla4 <- rbind(tabla4, fila)
}

cat("\n=== DISPERSION POR COLUMNA ===\n")
print(tabla4, row.names = FALSE)

