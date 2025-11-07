#' Tabla resumen de temperatura
#'
#' Esta función calcula estadísticas descriptivas de la variable
#' `temperatura_abrigo_150cm` para una o más estaciones.
#'
#' @param lista_estaciones Una lista que contiene data frames con los datos de las estaciones.
#'
#' @return Un data frame con el promedio, mínimo, máximo y cantidad de observaciones válidas.
#' @examples
#' \dontrun{
#' estaciones <- leer_varias_estaciones()
#' tabla_resumen_temperatura(estaciones)
#' }
#' @export
tabla_resumen_temperatura <- function(lista_estaciones) {
  if (!requireNamespace("dplyr", quietly = TRUE)) install.packages("dplyr")
  library(dplyr)

  lista_estaciones <- lista_estaciones[sapply(lista_estaciones, is.data.frame)]

  datos_combinados <- bind_rows(lista_estaciones, .id = "estacion")

  resumen <- datos_combinados |>
    group_by(estacion) |>
    summarise(
      media = mean(temperatura_abrigo_150cm, na.rm = TRUE),
      minimo = min(temperatura_abrigo_150cm, na.rm = TRUE),
      maximo = max(temperatura_abrigo_150cm, na.rm = TRUE),
      n = sum(!is.na(temperatura_abrigo_150cm))
    )

  return(resumen)
}
