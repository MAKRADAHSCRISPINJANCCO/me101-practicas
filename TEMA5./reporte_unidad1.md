## (a) Estadísticos descriptivos principales
Calculé la media, la desviación estándar y el coeficiente de variación (CV)
de `nota` y `asistencia_pct`. Como están en escalas distintas, comparé su
variabilidad con el CV (desviación entre media, en %) y no solo con la
desviación estándar. Todo quedó en la función `resumen_estadistico()`.

## (b) Nivel de dispersión
clasificar_dispersion()` clasifica el CV así: Baja (menor a 15 %), Moderada
(de 15 % a menos de 30 %) y Alta (30 % o más). La apliqué con un bucle for a
las dos columnas. Un CV alto significa que los datos varían mucho y la media
los representa peor.

## (c) Diferencias de convención entre librerías
**Varianza:** numpy divide entre n (ddof=0) y R entre n-1, por eso R sale
  un poco mayor.
**Skewness y kurtosis:** pandas, scipy y e1071 dan valores distintos porque
  usan fórmulas de ajuste diferentes.
