# Resumen de temperatura por estacion

Esta funcion calcula estadísticas descriptivas de la variable
`temperatura_abrigo_150cm` para una o mas estaciones y devuelve un
resumen por estación.

## Usage

``` r
resumen_temperatura(lista_estaciones)
```

## Arguments

- lista_estaciones:

  Una lista que contiene data frames con los datos de las estaciones.
  Cada elemento debe tener, al menos, las columnas `estacion` y
  `temperatura_abrigo_150cm`.

## Value

Un data frame con el promedio, minimo, maximo y cantidad de
observaciones validas por estacion.

## Examples

``` r
if (FALSE) { # \dontrun{
# estaciones <- leer_estaciones()
# tabla <- resumen_temperatura(estaciones)
} # }
```
