# ------------------------------------------------------------
# Qué hace:
#   Convierte una longitud expresada en centímetros a pulgadas.
# Qué argumentos requiere:
#   cm → número o vector numérico que representa longitudes en centímetros.
# Qué genera:
#   Devuelve el valor (o vector) equivalente en pulgadas.


cm_a_pulgadas <- function(cm) {
  pulgadas <- cm / 2.54
  return(pulgadas)
}


# ------------------------------------------------------------
# Qué hace:
#   Calcula la proporción de valores faltantes (NA) en un vector.
# Qué argumentos requiere:
#   x → vector de datos (numérico, lógico o de texto).
# Qué genera:
#   Devuelve un número entre 0 y 1 que indica el porcentaje de elementos NA.


proporcion_na <- function(x) {
  resultado <- mean(is.na(x))
  return(resultado)
}


# ------------------------------------------------------------
# Qué hace:
#   Normaliza un vector dividiendo cada elemento por la suma total de sus valores.
# Qué argumentos requiere:
#   x → vector numérico con los valores a normalizar.
# Qué genera:
#   Devuelve un nuevo vector cuyos elementos suman 1.


normalizar_vector <- function(x) {
  resultado <- x / sum(x, na.rm = TRUE)
  return(resultado)
}



