library(readxl)
datos_ambiental_evaluacion_tema9 <- read_excel("C:/Users/Usuario/Downloads/datos_ambiental_evaluacion_tema9.xlsx")
View(datos_ambiental_evaluacion_tema9)

library(pheatmap)
library(RColorBrewer)

df <- data.frame(
  estacion = c('Centro', 'San Jerónimo', 'Wanchaq', 'San Sebastián', 'Poroy'),
  pm10_ugm3 = c(45.0, 28.0, 62.0, 35.0, NA),
  no2_ppb = c(18.2, 12.5, 25.4, 15.0, 9.8),
  ruido_db = c(72.0, 58.0, 81.0, 65.0, 52.0),
  tipo_zona = c('Urbana', 'Valle', 'Urbana', 'Urbana', 'Altoandina'),
  stringsAsFactors = FALSE
)
rownames(df) <- df$estacion
df$estacion <- NULL 

#imputacion con mediana
mediana_pm10 <- median(df$pm10_ugm3, na.rm = TRUE)

df$pm10_ugm3[is.na(df$pm10_ugm3)] <- mediana_pm10

cat("--- Datos originales con PM10 imputado ---\n")
print(df)


#z-score
df_num <- df[, c('pm10_ugm3', 'no2_ppb', 'ruido_db')]
df_z <- as.data.frame(scale(df_num))

cat("\n--- Matriz Estandarizada Z-Score ---\n")
print(df_z)


pheatmap(as.matrix(df_z),
         color = colorRampPalette(rev(brewer.pal(n = 7, name = "RdBu")))(100),
         breaks = seq(-2.5, 2.5, length.out = 101), # Forzamos la escala centrada en 0
         cluster_rows = FALSE,  # Sin clustering según lo pedido en la Parte C
         cluster_cols = FALSE,
         display_numbers = TRUE,
         number_format = "%.2f", # Formato a 2 decimales
         border_color = "gray90",
         main = "Mapa de Calor Ambiental (Z-Score en R)",
         fontsize = 10)




png("clustermap_R_300dpi.png", width = 8, height = 7, units = "in", res = 300)
pheatmap(as.matrix(df_z),
         clustering_distance_rows = "euclidean",
         clustering_distance_cols = "euclidean",
         clustering_method = "ward.D2",
         cluster_rows = TRUE, cluster_cols = TRUE,
         color = paleta, breaks = quiebres,
         display_numbers = TRUE, number_format = "%.2f",
         main = "Clustermap con Dendrogramas (Euclidiana, Ward.D2)")
dev.off()






