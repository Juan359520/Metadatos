
tabla_resumen_temperatura <- function(lista_estaciones) {
  # Instalar y cargar dplyr si no está disponible
  if (!requireNamespace("dplyr", quietly = TRUE)) install.packages("dplyr")
  library(dplyr)

  # Filtrar solo los elementos que sean data frames (evita errores)
  solo_df <- estaciones[sapply(estaciones, is.data.frame)]

  leer_estaciones <- estaciones[sapply(estaciones, is.data.frame)]


  # Combinar todas las estaciones en un solo data frame
  datos_combinados <- bind_rows(leer_estaciones, .id = "estacion")

  # Crear la tabla resumen
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


