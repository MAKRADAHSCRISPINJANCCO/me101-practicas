## (a) Dimensiones de las imágenes sintéticas

- Imagen en escala de grises: shape (5, 5), dtype uint8, mean = 127.5.
  Degradado horizontal de 0 a 255 repetido en 5 filas.
- Imagen RGB: shape (4, 4, 3), dtype uint8.
  Dos mitades verticales de 2 columnas cada una.

## (b) Colores elegidos y su luminosidad

- Mitad izquierda: rojo puro (255, 0, 0) → luminosidad = 0.299·255 = 76.25
- Mitad derecha: azul puro (0, 0, 255) → luminosidad = 0.114·255 = 29.07
- Promedio simple para ambos: 85.0 (no distingue colores).
- Luminosidad ponderada: sí distingue (rojo más brillante que azul).

## (c) Umbral de binarización

Umbral elegido: 50.

Justificación: los dos niveles de luminosidad de mi imagen son 29.07 y 76.25.
Un umbral de 50 cae exactamente entre ambos, por lo que separa limpiamente
la mitad roja (queda blanca, 255) de la mitad azul (queda negra, 0).
Elegí 50 y no 128 porque 128 dejaría TODA la imagen en negro (ambos
valores son menores que 128), lo cual no aportaría información.
