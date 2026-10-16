1. Diseño de la imagen
Creé una imagen sintética de 120 × 120 píxeles con un fondo azul oscuro. Dibujé una estrella amarilla, un triángulo morado, un 
rombo naranja y una línea celeste. Utilicé Pillow para crear el diseño y guardarlo en formato PNG.

2. Comparación de escala de grises
Comparé el píxel del fondo mediante `convert("L")` de Pillow y `rgb2gray()` de scikit-image. 
Los resultados fueron [completar valor de Pillow] y [completar valor de scikit-image multiplicado por 255]. La diferencia fue [completar diferencia].

3. Umbral de Otsu
El umbral calculado fue [completar umbral]. La proporción de píxeles clasificados como `True` fue [completar proporción],
equivalente a [completar porcentaje] % de la imagen.

5. Filtros aplicados
Apliqué el desenfoque gaussiano para suavizar las figuras y el filtro FIND_EDGES para resaltar sus contornos.
Guardé los resultados en los archivos `imagen_blur.png` e `imagen_bordes.png`.
