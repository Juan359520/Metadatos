

leer_estaciones <- function() {
  if (!requireNamespace("cli", quietly = TRUE)) install.packages("cli")
  library(cli)

  # Crear carpeta 'datos' si no existe
  dir.create("datos", showWarnings = FALSE)

  # Vector con todas las URLs (metadatos + estaciones)
  urls <- c(
    metadatos = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/metadatos_completos.csv",
    NH0472 = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0472.csv",
    NH0910 = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0910.csv",
    NH0046 = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0046.csv",
    NH0098 = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0098.csv",
    NH0437 = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0437.csv"
  )

  # Lista vacía para guardar los data frames
  datos <- list()

  # Bucle para descargar y leer cada archivo
  for (nombre in names(urls)) {
    ruta <- paste0("datos/", nombre, ".csv")

    if (!file.exists(ruta)) {
      cli_inform(paste0("Descargando archivo para estación ", nombre, "..."))
      download.file(urls[nombre], destfile = ruta, mode = "wb")
      cli_inform("Descarga completa.")
    } else {
      cli_inform(paste0("El archivo de la estación ", nombre, " ya existe."))
    }

    datos[[nombre]] <- read.csv(ruta)
    cli_inform(paste0("Lectura completa para la estación ", nombre, "."))
  }

  cli_inform("✅ Proceso finalizado correctamente.")
  return(datos)
}


