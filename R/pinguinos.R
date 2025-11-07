
leer_pinguinos <- function(ruta_archivo) {
  if (!requireNamespace("cli", quietly = TRUE)) {
    install.packages("cli")
  }
  library(cli)

  url_datos <- "https://zenodo.org/records/12772944/files/pinguinos.csv?download=1"

  if (!file.exists(ruta_archivo)) {
    cli_inform("El archivo no existe en la ruta indicada. Se procederá a descargarlo...")
    download.file(url = url_datos, destfile = ruta_archivo, mode = "wb")
    cli_inform("Descarga completa. Leyendo los datos...")
  } else {
    cli_inform("El archivo ya existe. Se procederá a leerlo directamente...")
  }

  datos <- read.csv(ruta_archivo)
  cli_inform("Lectura finalizada correctamente.")
  return(datos)
}



