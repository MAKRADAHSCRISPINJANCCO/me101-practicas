#VERCTOR DE NOTAS
notas <- c(11, 14, 20, 8, 16, 13)

primero <- notas[1]
ultimo <- notas[6]

print(primero)
print(ultimo)

#PROMEDIO,MAXIMO Y APROBADOS
promedio <- mean(notas)
maximo <- max(notas)
cantidad_aprobados <- sum(notas >= 13.5)

print(promedio)
print(maximo)
print(cantidad_aprobados)

#DATA FRAME
datos <- data.frame(
  nombre = c("ISABEL", "FLOR", "ROSITA", "YOEL", "DAN"),
  nota = c(12, 15, 18, 14, 15),
  asistencia_pct = c(80, 75, 90, 65, 85)
)

print(datos)
