#' Descargar y leer datos de estaciones meteorológicas
#'
#' Descarga archivos .csv con metadatos y datos de estaciones
#' meteorológicas desde un repositorio en línea, los guarda en un
#' directorio y los lee en una lista de data frames.
#'
#' @param ruta_datos Directorio donde se guardarán/leerán los archivos
#'   .csv. Por defecto se usa \code{here::here("datos")}.
#'
#' @return Una lista nombrada de data frames, uno por archivo descargado.
#'
#'
#' @export
leer_estaciones <- function(ruta_datos = here::here("datos")) {

  # ---- VALIDACIONES ----

  # 1. Tipo correcto
  if (!is.character(ruta_datos)) {
    cli::cli_abort(c(
      "x" = "`ruta_datos` debe ser un string (vector de tipo character).",
      "i" = paste0("Se recibio un objeto de clase: ", class(ruta_datos)[1])
    ))
  }

  # 2. Longitud correcta
  if (length(ruta_datos) != 1L) {
    cli::cli_abort(c(
      "x" = "`ruta_datos` debe tener longitud 1.",
      "i" = paste0("Longitud recibida: ", length(ruta_datos))
    ))
  }

  # 3. No puede ser NA
  if (is.na(ruta_datos)) {
    cli::cli_abort(c(
      "x" = "`ruta_datos` no puede ser NA.",
      "i" = "Pasa una ruta valida, por ejemplo 'datos/'."
    ))
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

  # lista vacía para guardar los data frames
  datos <- vector("list", length(urls))
  names(datos) <- names(urls)

  # ---- DESCARGA Y LECTURA ----
  for (nombre in names(urls)) {

    ruta <- file.path(ruta_datos, paste0(nombre, ".csv"))

    # si el archivo no existe, lo descargamos
    if (!file.exists(ruta)) {
      cli::cli_inform(c(
        ">" = paste0("Descargando archivo para la estacion ", nombre, "..."),
        "i" = paste0("Guardando en: ", ruta)
      ))

      utils::download.file(
        url  = urls[[nombre]],
        destfile = ruta,
        mode = "wb",
        quiet = TRUE
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


