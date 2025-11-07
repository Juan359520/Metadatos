
grafico_temperatura_mensual <- function(datos, colores, titulo = "Temperatura") {
  if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")
  if (!requireNamespace("dplyr", quietly = TRUE)) install.packages("dplyr")
  if (!requireNamespace("lubridate", quietly = TRUE)) install.packages("lubridate")

  library(ggplot2)
  library(dplyr)
  library(lubridate)

  # Calcular promedio mensual
  datos_resumen <- datos |>
    mutate(mes = month(fecha, label = TRUE, abbr = TRUE)) |>
    group_by(estacion, mes) |>
    summarise(temp_promedio = mean(temperatura_abrigo_150cm, na.rm = TRUE))

  # Crear gráfico
  grafico <- ggplot(datos_resumen, aes(x = mes, y = temp_promedio, color = estacion, group = estacion)) +
    geom_line(size = 1) +
    geom_point(size = 2) +
    scale_color_manual(values = colores) +
    labs(
      title = titulo,
      x = "Mes",
      y = "Temperatura promedio (°C)",
      color = "Estación"
    ) +
    theme_minimal(base_size = 14)

  return(grafico)
}
