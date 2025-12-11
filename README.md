
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Metadatos

`Metadatos` es un paquete de prueba creado con fines **educativos y de
práctica**.  
Su objetivo es mostrar cómo crear, documentar y distribuir un paquete en
R.

El paquete incluye funciones para descargar, procesar y analizar datos
meteorológicos de distintas estaciones.

------------------------------------------------------------------------

# ⬇️ Instalación

-install.packages(“devtools”) -devtools::load_all()

## 👨‍💻 Como empezar a usarlo rapidamente

Cargar el paquete ➡️ library(Metadatos)

Ver los datasets incluidos en el paquete ➡️ data(package = “Metadatos”)

Cargar los metadatos ➡️ data(metadatos) head(metadatos)

Cargar una estación ➡️ data(NH0046) head(NH0046)

Calcular un resumen de temperatura ➡️ res \<-
resumen_temperatura(NH0046)

# 📊 Graficar la temperatura mensual

grafico_temperatura_mensual(res)

## ⚙️ Funciones principales

### 📋 resumen_temperatura()\`

🧮 Genera un **resumen estadístico completo** de la temperatura medida a
150 cm de altura.  
Incluye:  
- 🌡️ \*\*resumen_temperatura\*

Devuelve un **data frame** con los resultados, ideal para análisis
comparativos entre estaciones
