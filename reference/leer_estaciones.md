# Descargar y leer datos de estaciones meteorologicas

Descarga archivos .csv con metadatos y datos de estaciones
meteorologicas desde un repositorio en linea, los guarda en un
directorio y los lee en una lista de data frames.

## Usage

``` r
leer_estaciones(ruta_datos = here::here("datos"))
```

## Arguments

- ruta_datos:

  Directorio donde se guardaran/leeran los archivos .csv. Por defecto se
  usa `here::here("datos")`.

## Value

Una lista nombrada de data frames, uno por archivo descargado.

## Examples

``` r
if (FALSE) { # \dontrun{
# Ejemplo de uso (requiere conexión a internet y archivo remoto)
# estaciones <- leer_estaciones("ruta/a/carpeta")
} # }
```
