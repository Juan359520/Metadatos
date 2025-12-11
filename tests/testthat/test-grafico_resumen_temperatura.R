test_that("grafico_temperatura_mensual devuelve un ggplot con datos válidos", {

  datos <- data.frame(
    estacion = c("A", "A", "B", "B"),
    fecha = as.Date(c("2020-01-01", "2020-01-15", "2020-02-01", "2020-02-20")),
    temperatura_abrigo_150cm = c(10, 12, 8, 9)
  )

  p <- grafico_temperatura_mensual(
    datos   = datos,
    colores = c("red", "blue"),
    titulo  = "Temperatura promedio"
  )

  # la función debe devolver un objeto ggplot
  expect_s3_class(p, "ggplot")
})

test_that("grafico_temperatura_mensual usa el titulo por defecto sin romperse", {

  datos <- data.frame(
    estacion = c("A", "A"),
    fecha = as.Date(c("2020-03-01", "2020-04-01")),
    temperatura_abrigo_150cm = c(15, 18)
  )

  # no paso 'titulo', se debería usar el valor por defecto
  p <- grafico_temperatura_mensual(
    datos   = datos,
    colores = c("red")
  )

  expect_s3_class(p, "ggplot")
})

test_that("grafico_temperatura_mensual falla si datos no es un data.frame", {

  datos_malos <- 123

  expect_error(
    grafico_temperatura_mensual(
      datos   = datos_malos,
      colores = c("red", "blue"),
      titulo  = "Temperatura"
    )
  )
})

test_that("grafico_temperatura_mensual falla si faltan columnas requeridas", {

  datos_malos <- data.frame(
    estacion = c("A", "A"),
    temperatura_abrigo_150cm = c(10, 12)
    # falta 'fecha'
  )

  expect_error(
    grafico_temperatura_mensual(
      datos   = datos_malos,
      colores = c("red", "blue"),
      titulo  = "Temperatura"
    )
  )
})

test_that("grafico_temperatura_mensual falla si colores no es un vector", {

  datos <- data.frame(
    estacion = c("A", "A"),
    fecha = as.Date(c("2020-01-01", "2020-02-01")),
    temperatura_abrigo_150cm = c(10, 12)
  )

  expect_error(
    grafico_temperatura_mensual(
      datos   = datos,
      colores = matrix(c("red", "blue")),  # matrix -> is.vector() da FALSE
      titulo  = "Temperatura"
    )
  )

})
