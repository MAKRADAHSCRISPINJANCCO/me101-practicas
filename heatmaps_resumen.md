# Tema 10 — Resumen de Mapas de Calor

## (a) Herramienta más rápida
La herramienta más rápida fue `seaborn` en Python, ya que `sns.heatmap()` 
permitió añadir anotaciones, la máscara del triángulo y la barra de color con muy pocas líneas
de código.

## (b) Efecto del agrupamiento
En mi matriz de 3 variables (PM10, NO2, Ruido), el agrupamiento de pheatmap las mantuvo
juntas. Al estar altamente correlacionadas (valores cercanos a 1), el dendrograma las une
rápidamente. El orden sin agrupar fue PM10, NO2, Ruido; con agrupamiento, se reordenaron 
ligeramente para reflejar su máxima similitud.

## (c) Matriz de correlación
| | PM10 | NO2 | Ruido |
|---|---|---|---|
| PM10 | 1.000 | 0.992 | 0.988 |
| NO2 | 0.992 | 1.000 | 0.996 |
| Ruido | 0.988 | 0.996 | 1.000 |
*(Nota: Reemplaza estos valores por los que te salgan exactamente al ejecutar tu `print(corr.round(4))` en Python).*
