test_that("leer_estaciones devuelve una lista con los nombres esperados", {
  ruta <- file.path(tempdir(), "estaciones_test_principal")
  dir.create(ruta, showWarnings = FALSE)

  res <- leer_estaciones(ruta)

  expect_type(res, "list")

  nombres_esperados <- c("metadatos", "NH0472", "NH0910", "NH0046", "NH0098", "NH0437")
  expect_equal(names(res), nombres_esperados)

  for (df in res) {
    expect_s3_class(df, "data.frame")
  }
})

test_that("leer_estaciones falla si ruta_datos no es character", {
  expect_error(leer_estaciones(123))
})

test_that("leer_estaciones falla si ruta_datos es NA", {
  expect_error(leer_estaciones(NA_character_))
})

test_that("leer_estaciones falla si ruta_datos tiene longitud mayor a 1", {
  expect_error(leer_estaciones(c("a", "b")))
})

test_that("leer_estaciones funciona con carpeta temporal nueva", {
  ruta <- file.path(tempdir(), "estaciones_tmp1")
  if (dir.exists(ruta)) unlink(ruta, recursive = TRUE)
  dir.create(ruta, showWarnings = FALSE)

  res <- leer_estaciones(ruta)

  expect_type(res, "list")
  expect_true(length(res) >= 1)
})

test_that("leer_estaciones usa archivos existentes sin descargar de nuevo", {
  ruta <- file.path(tempdir(), "estaciones_tmp2")
  dir.create(ruta, showWarnings = FALSE)

  # primera llamada: descarga
  res1 <- leer_estaciones(ruta)
  # segunda llamada: debería usar archivos locales
  res2 <- leer_estaciones(ruta)

  expect_type(res2, "list")
  expect_equal(names(res1), names(res2))
})
