library(tidyverse)

# Dataset del Tema 9, imputación con mediana y correlación
df <- data.frame(
  pm10_ugm3 = c(45, 28, 62, 35, NA),
  no2_ppb   = c(18.2, 12.5, 25.4, 15.0, 9.8),
  ruido_db  = c(72, 58, 81, 65, 52),
  tipo_zona = c("Urbana", "Valle", "Urbana", "Urbana", "Altoandina"),
  row.names = c("Centro", "San Jerónimo", "Wanchaq", "San Sebastián", "Poroy")
)
mediana_pm10 <- median(df$pm10_ugm3, na.rm = TRUE)
df$pm10_ugm3[is.na(df$pm10_ugm3)] <- mediana_pm10   # Poroy = 40

datos <- df[, c("pm10_ugm3", "no2_ppb", "ruido_db")]
matriz_corr <- cor(datos)
print(round(matriz_corr, 4))

# Formato largo
corr_larga <- as.data.frame(matriz_corr) %>%
  rownames_to_column("var1") %>%
  pivot_longer(cols = -var1, names_to = "var2", values_to = "correlacion")

print(nrow(corr_larga))                    # 9
print(nrow(corr_larga) == ncol(datos)^2)   # TRUE

# Heatmap con ggplot2
orden <- colnames(matriz_corr)
corr_larga <- corr_larga %>%
  mutate(var1 = factor(var1, levels = rev(orden)),
         var2 = factor(var2, levels = orden))

p <- ggplot(corr_larga, aes(x = var2, y = var1, fill = correlacion)) +
  geom_tile(color = "white") +
  geom_text(aes(label = round(correlacion, 2))) +
  scale_fill_gradient2(low = "blue", mid = "white", high = "red",
                       midpoint = 0, limits = c(-1, 1)) +
  coord_fixed() +
  labs(title = "Matriz de correlación (ggplot2)", x = NULL, y = NULL) +
  theme_minimal()

print(p)
ggsave("heatmap_ggplot2.png", plot = p, width = 6, height = 5, dpi = 150)




library(pheatmap)

pheatmap(
  matriz_corr,
  display_numbers = TRUE,
  number_format  = "%.3f",
  color = colorRampPalette(c("blue", "white", "red"))(50),
  breaks = seq(-1, 1, length.out = 51),
  main = "pheatmap CON agrupamiento",
  filename = "heatmap_pheatmap_agrupado.png",
  width = 7, height = 6
)


pheatmap(
  matriz_corr,
  display_numbers = TRUE,
  number_format  = "%.3f",
  color = colorRampPalette(c("blue", "white", "red"))(50),
  breaks = seq(-1, 1, length.out = 51),
  cluster_rows = FALSE,
  cluster_cols = FALSE,
  main = "pheatmap SIN agrupamiento",
  filename = "heatmap_pheatmap_sin_agrupar.png",
  width = 7, height = 6
)
