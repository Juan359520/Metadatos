# Tabla resumen de temperatura por estacion

Esta funcion calcula estadísticas descriptivas de la variable
`temperatura_abrigo_150cm` para una o mas estaciones y devuelve una
tabla resumen por estación.

A partir de una lista de data frames con datos de estaciones
meteorologicas, esta funcion combina las estaciones (ignorando el
elemento `"metadatos"`) y calcula estadisticas descriptivas de la
variable `temperatura_abrigo_150cm` para cada estacion.

## Usage

``` r
tabla_resumen_temperatura(lista_estaciones)

tabla_resumen_temperatura(lista_estaciones)
```

## Arguments

- lista_estaciones:

  Una lista que contiene data frames con los datos de las estaciones.
  Los elementos deben corresponder a estaciones individuales (por
  ejemplo, `"NH0472"`, `"NH0910"`, etc.) y cada data frame debe tener,
  al menos, las columnas `estacion` (o se genera a partir del nombre de
  la lista) y `temperatura_abrigo_150cm`.

## Value

Un data frame con el promedio, minimo, maximo y cantidad de
observaciones validas por estacion.

Un data frame con el promedio, minimo, maximo y cantidad de
observaciones validas (`n`) por estacion.

## Examples

``` r
if (FALSE) { # \dontrun{
# estaciones <- leer_estaciones()
# tabla <- tabla_resumen_temperatura(estaciones)
} # }
if (FALSE) { # \dontrun{
data(NH0046)
data(NH0098)
estaciones <- list(NH0046 = NH0046, NH0098 = NH0098)
tabla_resumen_temperatura(estaciones)
} # }
```
