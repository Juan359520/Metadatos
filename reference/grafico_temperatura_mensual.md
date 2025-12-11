# Grafico de temperatura promedio mensual por estacion

Calcula la temperatura promedio mensual por estacion a partir de un
conjunto de datos y genera un grafico de lineas con puntos.

## Usage

``` r
grafico_temperatura_mensual(datos, colores, titulo = "Temperatura")
```

## Arguments

- datos:

  Data frame con al menos las columnas: `fecha`, `estacion` y
  `temperatura_abrigo_150cm`.

- colores:

  Vector de colores a usar para cada estacion.

- titulo:

  Titulo del grafico. Por defecto `"Temperatura"`.

## Value

Un objeto `ggplot` con el grafico de temperatura mensual.

## Examples

``` r
{
# Usar una estación incluida en el paquete
data(NH0046)

# Graficar la temperatura mensual


}
```
