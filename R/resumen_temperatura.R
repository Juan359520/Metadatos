#' Tabla resumen de temperatura por estacion
#'
#' Esta funcion calcula estadísticas descriptivas de la variable
#' \code{temperatura_abrigo_150cm} para una o mas estaciones y devuelve
#' una tabla resumen por estación.
#'
#' @param lista_estaciones Una lista que contiene data frames con los
#'   datos de las estaciones. Cada elemento debe tener, al menos, las
#'   columnas \code{estacion} y \code{temperatura_abrigo_150cm}.
#'
#' @return Un data frame con el promedio, minimo, maximo y cantidad de
#'   observaciones validas por estacion.
#' @export
#'
#' @examples
#' \dontrun{
#' # estaciones <- leer_estaciones()
#' # tabla <- tabla_resumen_temperatura(estaciones)
#' }

tabla_resumen_temperatura <- function(lista_estaciones) {

  # ---- VALIDACIONES ----

  # 1. Debe ser una lista
  if (!is.list(lista_estaciones)) {
    cli::cli_abort(c(
      "x" = "'lista_estaciones' debe ser una lista.",
      "i" = paste0("Se recibio un objeto de clase: ",
                   class(lista_estaciones)[1])
    ))
  }

  # 2. Filtramos solo los elementos que sean data.frame
  es_df <- vapply(lista_estaciones, is.data.frame, logical(1))

  if (!any(es_df)) {
    cli::cli_abort(c(
      "x" = "'lista_estaciones' no contiene data frames validos.",
      "i" = "Asegurate de pasar una lista con al menos un data frame."
    ))
  }

  lista_estaciones <- lista_estaciones[es_df]

  # ---- COMBINAR DATOS ----

  datos_combinados <- dplyr::bind_rows(lista_estaciones, .id = "estacion")

  columnas_req <- c("estacion", "temperatura_abrigo_150cm")
  faltan <- setdiff(columnas_req, names(datos_combinados))

  if (length(faltan) > 0) {
    cli::cli_abort(c(
      "x" = "Faltan columnas requeridas en los datos combinados.",
      "!" = paste("Columnas faltantes:", paste(faltan, collapse = ", ")),
      "i" = "Revisa que los data frames de entrada tengan los nombres correctos."
    ))
  }

  # ---- RESUMEN ----

  resumen <- datos_combinados |>
    dplyr::group_by(estacion) |>
    dplyr::summarise(
      media  = mean(temperatura_abrigo_150cm, na.rm = TRUE),
      minimo = min(temperatura_abrigo_150cm, na.rm = TRUE),
      maximo = max(temperatura_abrigo_150cm, na.rm = TRUE),
      n      = sum(!is.na(temperatura_abrigo_150cm)),
      .groups = "drop"
    )

  resumen
}
