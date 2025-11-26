#' Tabla resumen de temperatura por estacion
#'
#' A partir de una lista de data frames con datos de estaciones
#' meteorologicas, esta funcion combina las estaciones (ignorando el
#' elemento \code{"metadatos"}) y calcula estadisticas descriptivas de
#' la variable \code{temperatura_abrigo_150cm} para cada estacion.
#'
#' @param lista_estaciones Una lista que contiene data frames con los
#'   datos de las estaciones. Los elementos deben corresponder a
#'   estaciones individuales (por ejemplo, \code{"NH0472"}, \code{"NH0910"}, etc.)
#'   y cada data frame debe tener, al menos, las columnas
#'   \code{estacion} (o se genera a partir del nombre de la lista) y
#'   \code{temperatura_abrigo_150cm}.
#'
#' @return Un data frame con el promedio, minimo, maximo y cantidad de
#'   observaciones validas (\code{n}) por estacion.
#' @export
#'
#' @examples
#' \dontrun{
#' data(NH0046)
#' data(NH0098)
#' estaciones <- list(NH0046 = NH0046, NH0098 = NH0098)
#' tabla_resumen_temperatura(estaciones)
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

  # 2. Nos quedamos solo con las estaciones (sacamos 'metadatos', si existiera)
  estaciones <- lista_estaciones[names(lista_estaciones) != "metadatos"]

  if (length(estaciones) == 0) {
    cli::cli_abort(c(
      "x" = "La lista no contiene elementos de estaciones.",
      "i" = "Revisa que 'lista_estaciones' tenga al menos una estacion distinta de 'metadatos'."
    ))
  }

  # 3. Filtrar solo elementos que sean data.frame
  es_df <- vapply(estaciones, is.data.frame, logical(1))

  if (!any(es_df)) {
    cli::cli_abort(c(
      "x" = "Ningun elemento de 'lista_estaciones' es un data.frame valido.",
      "i" = "Asegurate de pasar una lista con data frames de estaciones."
    ))
  }

  estaciones <- estaciones[es_df]

  # ---- COMBINAR DATOS ----

  datos_combinados <- dplyr::bind_rows(estaciones, .id = "estacion")

  columnas_req <- c("estacion", "temperatura_abrigo_150cm")
  faltan <- setdiff(columnas_req, names(datos_combinados))

  if (length(faltan) > 0) {
    cli::cli_abort(c(
      "x" = "Faltan columnas requeridas en los datos combinados.",
      "!" = paste("Columnas faltantes:", paste(faltan, collapse = ", ")),
      "i" = "Revisa que los data frames de cada estacion tengan los nombres correctos."
    ))
  }

  # ---- TABLA RESUMEN ----

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



