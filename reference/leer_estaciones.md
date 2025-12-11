# Descargar y leer datos de estaciones meteorológicas

Descarga archivos .csv con metadatos y datos de estaciones
meteorológicas desde un repositorio en línea, los guarda en un
directorio y los lee en una lista de data frames.

## Usage

``` r
leer_estaciones(ruta_datos = here::here("datos"))
```

## Arguments

- ruta_datos:

  Directorio donde se guardarán/leerán los archivos .csv. Por defecto se
  usa `here::here("datos")`.

## Value

Una lista nombrada de data frames, uno por archivo descargado.
