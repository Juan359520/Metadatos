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
data("NH0046")
data("NH0098")
estaciones <- list(
  NH0046 = NH0046,
  NH0098 = NH0098
)
resumen_temperatura(estaciones)
#> # A tibble: 2 × 5
#>   estacion media minimo maximo     n
#>   <chr>    <dbl>  <dbl>  <dbl> <int>
#> 1 NH0046    17.3  -0.25   34.6 16782
#> 2 NH0098    18.6 -17.4    37.4 23540
```
