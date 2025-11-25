# Tabla resumen de temperatura

Esta función calcula estadísticas descriptivas de la variable
`temperatura_abrigo_150cm` para una o más estaciones.

## Usage

``` r
tabla_resumen_temperatura(lista_estaciones)
```

## Arguments

- lista_estaciones:

  Una lista que contiene data frames con los datos de las estaciones.

## Value

Un data frame con el promedio, mínimo, máximo y cantidad de
observaciones válidas.

## Examples

``` r
if (FALSE) { # \dontrun{
estaciones <- leer_varias_estaciones()
tabla_resumen_temperatura(estaciones)
} # }
```
