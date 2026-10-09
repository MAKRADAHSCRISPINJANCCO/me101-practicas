#PRIMER SCRIPT
fila <- c(0, 63, 127, 191, 255)

gris <- matrix(
  rep(fila, times = 5),
  nrow = 5,
  ncol = 5,
  byrow = TRUE
)

print(gris)
print(dim(gris))
print(mean(gris))



#SEGUNDO SCRIPT

rgb <- array(0, dim = c(4, 4, 3))
rgb[, 1:2, 1] <- 255
rgb[, 3:4, 3] <- 255

print(rgb[1, 1, ])
print(rgb[1, 4, ])





#TERCER SCRIPT

gris_luminosidad <- (
  0.299 * rgb[, , 1] +
    0.587 * rgb[, , 2] +
    0.114 * rgb[, , 3]
)

print(gris_luminosidad)

