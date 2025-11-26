#' Grafico de temperatura promedio mensual por estacion
#'
#' Calcula la temperatura promedio mensual por estacion a partir de un conjunto
#' de datos y genera un grafico de lineas con puntos.
#'
#' @param datos Data frame con al menos las columnas:
#'   \code{fecha}, \code{estacion} y \code{temperatura_abrigo_150cm}.
#' @param colores Vector de colores a usar para cada estacion.
#' @param titulo Titulo del grafico. Por defecto \code{"Temperatura"}.
#'
#' @return Un objeto \code{ggplot} con el grafico de temperatura mensual.
#' @export
#'
#' @examples
#' \dontrun{
#' # Usar una estación incluida en el paquete
#' data(NH0046)
#'
#' # Graficar la temperatura mensual
#' grafico_temperatura_mensual(
#'   datos = NH0046,
#'   colores = c("red", "blue", "green")
#' )
#' }

grafico_temperatura_mensual <- function(datos, colores, titulo = "Temperatura") {

  # ---- VALIDACIONES ----

  # 1. 'datos' debe ser un data.frame
  if (!is.data.frame(datos)) {
    cli::cli_abort(c(
      "x" = "'datos' debe ser un data.frame.",
      "i" = paste0("Se recibio un objeto de clase: ", class(datos)[1])
    ))
  }

  # 2. Columnas obligatorias
  columnas_req <- c("fecha", "estacion", "temperatura_abrigo_150cm")
  faltantes <- setdiff(columnas_req, names(datos))

  if (length(faltantes) > 0) {
    cli::cli_abort(c(
      "x" = "Faltan columnas requeridas en 'datos'.",
      "!" = paste("Columnas faltantes:", paste(faltantes, collapse = ", ")),
      "i" = "Asegurate de incluir todas las variables necesarias."
    ))
  }

  # 3. Colores debe ser un vector
  if (!is.vector(colores)) {
    cli::cli_abort(c(
      "x" = "'colores' debe ser un vector.",
      "i" = paste0("Clase ingresada: ", class(colores)[1])
    ))
  }

  # ---- PROCESAMIENTO ----

  datos_resumen <- datos |>
    dplyr::mutate(
      mes = lubridate::month(fecha, label = TRUE, abbr = TRUE)
    ) |>
    dplyr::group_by(estacion, mes) |>
    dplyr::summarise(
      temp_promedio = mean(temperatura_abrigo_150cm, na.rm = TRUE),
      .groups = "drop"
    )

  # ---- GRAFICO ----

  ggplot2::ggplot(
    datos_resumen,
    ggplot2::aes(
      x = mes,
      y = temp_promedio,
      color = estacion,
      group = estacion
    )
  ) +
    ggplot2::geom_line(size = 1) +
    ggplot2::geom_point(size = 2) +
    ggplot2::scale_color_manual(values = colores) +
    ggplot2::labs(
      title = titulo,
      x = "Mes",
      y = "Temperatura promedio (Celsius)",
      color = "Estacion"
    ) +
    ggplot2::theme_minimal(base_size = 14)
}


