test_that("tabla_resumen_temperatura devuelve un data.frame", {
  estaciones <- leer_estaciones()
  resumen <- tabla_resumen_temperatura(estaciones)
  expect_s3_class(resumen, "data.frame")
  expect_true("media" %in% names(resumen))
})

