test_that("resumen_temperatura devuelve un data.frame", {
  data("NH0046")
  data("NH0098")

  estaciones <- list(
    NH0046 = NH0046,
    NH0098 = NH0098
  )

  resultado <- resumen_temperatura(estaciones)

  expect_s3_class(resultado, "data.frame")
  expect_true(all(c("estacion", "media", "minimo", "maximo", "n") %in% names(resultado)))
})





