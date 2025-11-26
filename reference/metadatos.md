# Metadatos de estaciones meteorológicas

Data frame con información descriptiva de las estaciones usadas en el
paquete.

## Usage

``` r
metadatos
```

## Format

Un data frame con X filas y Y columnas.

## Source

Elaboración propia

## Examples

``` r
data(metadatos)
head(metadatos)
#>        id                       nombre       tipo          localidad
#> 1 A872999    Instituto de Clima y Agua Nimbus THP         Hurlingham
#> 2 A872834         Lima - EEA San Pedro Nimbus THP               Lima
#> 3 A872823           Anguil -EEA Anguil Nimbus THP             Anguil
#> 4 A872822  Huinca Renanco - EEA Anguil Nimbus THP     Huinca Renanco
#> 5 A872821 Gral San Martin - EEA Anguil Nimbus THP General San Martin
#> 6 A872819       Miramar - EEA Balcarce Nimbus THP            Miramar
#>      provincia    lat    lon altura                                ubicacion
#> 1 Buenos Aires -90.00   0.00   22.0            Jardin Botanico Ragonese INTA
#> 2 Buenos Aires -34.08 -59.21   28.0                   Ruta 9 - Km 100 - Lima
#> 3     La Pampa -36.54 -63.99  165.0     Ruta Nacional Nº 5 Km. 580. CP: 6326
#> 4      Córdoba -34.77 -64.37  189.0           Ruta Nac. Nº35 Km.535 CP: 6270
#> 5     La Pampa -38.00 -63.52  177.9         Ruta Nac. Nº35 Km. 110. CP: 8206
#> 6 Buenos Aires -38.15 -57.99   12.0 Ruta Nº 77, km.20. CP:7607 Gral Alvarado
#>                       desde                     hasta
#> 1 2000-01-04T00:00:00Z[UTC] 2024-05-23T00:00:00Z[UTC]
#> 2 2010-08-25T00:00:00Z[UTC] 2024-03-23T00:00:00Z[UTC]
#> 3 2010-09-13T00:00:00Z[UTC] 2024-06-18T00:00:00Z[UTC]
#> 4 2010-09-06T00:00:00Z[UTC] 2022-11-02T00:00:00Z[UTC]
#> 5 2010-09-10T00:00:00Z[UTC] 2022-06-15T00:00:00Z[UTC]
#> 6 2010-11-11T00:00:00Z[UTC] 2024-02-01T00:00:00Z[UTC]
```
