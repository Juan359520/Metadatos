#' Descargar y leer datos de estaciones meteorologicas
#'
#' Descarga archivos .csv con metadatos y datos de estaciones
#' meteorologicas desde un repositorio en linea, los guarda en un
#' directorio y los lee en una lista de data frames.
#'
#' @param ruta_datos Directorio donde se guardaran/leeran los archivos
#'   .csv. Por defecto se usa \code{here::here("datos")}.
#'
#' @return Una lista nombrada de data frames, uno por archivo descargado.
#' @export
leer_estaciones <- function(ruta_datos = here::here("datos"))
#' @examples
#' \dontrun{
#' # Ejemplo de uso (requiere conexión a internet y archivo remoto)
#' # estaciones <- leer_estaciones("ruta/a/carpeta")
#' }

 {

  # ---- VALIDACIONES ----

  # ruta_datos debe ser un string valido
  if (!is.character(ruta_datos) || length(ruta_datos) != 1L || is.na(ruta_datos)) {
    cli::cli_abort(c(
      "x" = "'ruta_datos' debe ser un string de longitud 1.",
      "i" = paste0("Se recibio un objeto de clase: ", class(ruta_datos)[1])
    ))
  }

  # crear carpeta si no existe
  if (!dir.exists(ruta_datos)) {
    dir.create(ruta_datos, recursive = TRUE, showWarnings = FALSE)

    if (!dir.exists(ruta_datos)) {
      cli::cli_abort(c(
        "x" = "No se pudo crear el directorio indicado en 'ruta_datos'.",
        "i" = paste0("Ruta: ", ruta_datos)
      ))
    }
  }

  # ---- URLS DE LOS ARCHIVOS ----

  urls <- c(
    metadatos = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/metadatos_completos.csv",
    NH0472   = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0472.csv",
    NH0910   = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0910.csv",
    NH0046   = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0046.csv",
    NH0098   = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0098.csv",
    NH0437   = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0437.csv"
  )

  # lista vacia para guardar los data frames
  datos <- vector("list", length(urls))
  names(datos) <- names(urls)

  # ---- DESCARGA Y LECTURA ----

  for (nombre in names(urls)) {

    ruta <- file.path(ruta_datos, paste0(nombre, ".csv"))

    # si el archivo NO existe, lo descargamos
    if (!file.exists(ruta)) {
      cli::cli_inform(c(
        ">" = paste0("Descargando archivo para la estacion ", nombre, "..."),
        "i" = paste0("Guardando en: ", ruta)
      ))

      utils::download.file(
        url      = urls[[nombre]],
        destfile = ruta,
        mode     = "wb",
        quiet    = TRUE
      )

      cli::cli_inform("Descarga completa.")
    } else {
      cli::cli_inform(c(
        "i" = paste0("El archivo de la estacion ", nombre,
                     " ya existe. Se usara el archivo local.")
      ))
    }

    # lectura del archivo
    datos[[nombre]] <- utils::read.csv(ruta)

    cli::cli_inform(c(
      "v" = paste0("Lectura completa para la estacion ", nombre, ".")
    ))
  }

  cli::cli_inform(c("v" = "Proceso finalizado correctamente."))

  datos
}


