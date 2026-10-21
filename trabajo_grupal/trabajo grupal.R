# ============================================================
# PROCESAMIENTO DE IMAGENES EN RSTUDIO
# ============================================================

library(magick)
library(imager)

# ============================================================
# 1. CARGAR IMAGEN ORIGINAL
# ============================================================

ruta <- "C:/Users/Usuario/Downloads/WhatsApp Image 2026-10-19 at 11.29.25 AM.jpeg"

if (!file.exists(ruta)) {
  stop("No se encuentra la imagen. Revisa la ruta del archivo.")
}

img <- image_read(ruta)

# Funcion para mostrar imagenes de magick con imager
mostrar_imagen <- function(imagen, titulo = "Imagen") {
  temporal <- tempfile(fileext = ".png")
  
  magick::image_write(
    imagen,
    path = temporal,
    format = "png"
  )
  
  imagen_imager <- imager::load.image(temporal)
  
  plot(imagen_imager, main = titulo)
}

# Informacion de la imagen
print(image_info(img))

# Mostrar original
mostrar_imagen(img, "Imagen original")


# ============================================================
# 2. REDIMENSIONAMIENTO
# ============================================================

ampliada <- image_resize(img, "200%")
reducida <- image_resize(img, "50%")

par(mfrow = c(1, 3))
mostrar_imagen(img, "Imagen original")
mostrar_imagen(ampliada, "Imagen ampliada")
mostrar_imagen(reducida, "Imagen reducida")
par(mfrow = c(1, 1))


# ============================================================
# 3. ROTACION
# ============================================================

rotada <- image_rotate(img, 30)

par(mfrow = c(1, 2))
mostrar_imagen(img, "Imagen original")
mostrar_imagen(rotada, "Rotacion de 30 grados")
par(mfrow = c(1, 1))


# ============================================================
# 4. TRASLACION
# ============================================================

info <- image_info(img)
ancho <- info$width[1]
alto <- info$height[1]

# Crear un lienzo blanco mas grande
lienzo <- image_blank(
  width = ancho + 150,
  height = alto + 100,
  color = "white"
)

# Colocar la imagen desplazada
desplazada <- image_composite(
  lienzo,
  img,
  operator = "over",
  gravity = "northwest",
  offset = "+100+70"
)

par(mfrow = c(1, 2))
mostrar_imagen(img, "Imagen original")
mostrar_imagen(desplazada, "Imagen trasladada")
par(mfrow = c(1, 1))


# ============================================================
# 5. DEFORMACION O SHEARING
# ============================================================

# Aplicar transformacion afin para inclinar la imagen
# Los parametros correctos de image_distort() son
# 'distortion' y 'coordinates' (no 'method' ni 'arguments').
# Cada grupo de 4 valores representa un punto de control:
# x_origen, y_origen, x_destino, y_destino
deformada <- image_distort(
  img,
  distortion = "Affine",
  coordinates = c(
    0, 0,           0, 0,               # esquina superior izquierda
    ancho, 0,       ancho, 0,           # esquina superior derecha
    0, alto,        0.20 * alto, alto   # esquina inferior izquierda desplazada
  ),
  bestfit = TRUE
)

par(mfrow = c(1, 2))
mostrar_imagen(img, "Imagen original")
mostrar_imagen(deformada, "Imagen deformada")
par(mfrow = c(1, 1))


# ============================================================
# 6. NORMALIZACION
# ============================================================

normalizada <- image_normalize(img)

par(mfrow = c(1, 2))
mostrar_imagen(img, "Imagen original")
mostrar_imagen(normalizada, "Imagen normalizada")
par(mfrow = c(1, 1))


# ============================================================
# 7. DETECCION DE BORDES
# ============================================================

gris <- image_convert(
  img,
  colorspace = "gray"
)

bordes <- image_morphology(
  gris,
  method = "Edge",
  kernel = "Octagon"
)

par(mfrow = c(1, 2))
mostrar_imagen(img, "Imagen original")
mostrar_imagen(bordes, "Deteccion de bordes")
par(mfrow = c(1, 1))


# ============================================================
# 8. DESENFOQUE
# ============================================================

desenfocada <- image_blur(
  img,
  radius = 0,
  sigma = 5
)

par(mfrow = c(1, 2))
mostrar_imagen(img, "Imagen original")
mostrar_imagen(desenfocada, "Imagen desenfocada")
par(mfrow = c(1, 1))


# ============================================================
# 9. PROCESAMIENTO MORFOLOGICO
# ============================================================

# Las operaciones se realizan en escala de grises
gris <- image_convert(
  img,
  colorspace = "gray"
)

# Dilatacion
dilatada <- image_morphology(
  gris,
  method = "Dilate",
  kernel = "Diamond"
)

# Erosion
erosionada <- image_morphology(
  gris,
  method = "Erode",
  kernel = "Diamond"
)

# Apertura
apertura <- image_morphology(
  gris,
  method = "Open",
  kernel = "Diamond"
)

# Cierre
cierre <- image_morphology(
  gris,
  method = "Close",
  kernel = "Diamond"
)

par(mfrow = c(2, 2))
mostrar_imagen(dilatada, "Dilatacion")
mostrar_imagen(erosionada, "Erosion")
mostrar_imagen(apertura, "Apertura")
mostrar_imagen(cierre, "Cierre")
par(mfrow = c(1, 1))

