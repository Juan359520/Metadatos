test_that("tabla_resumen_temperatura devuelve un data.frame", {

  # Crear el objeto estaciones usando la función existente
  estaciones <- leer_estaciones()

  # Ejecutar la función que queremos testear
  resultado <- resumen_temperatura(estaciones)

  # Verificar que devuelve un data.frame
  expect_s3_class(resultado, "data.frame")
})





