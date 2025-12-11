test_that("resumen_temperatura calcula correctamente el resumen por estación", {

  df1 <- data.frame(
    temperatura_abrigo_150cm = c(10, 20, 30)
  )

  df2 <- data.frame(
    temperatura_abrigo_150cm = c(5, 15, 25, 35)
  )

  lista <- list(
    NH0046 = df1,
    NH0098 = df2
  )

  res <- resumen_temperatura(lista)

  expect_s3_class(res, "data.frame")
  expect_true(all(c("estacion", "media", "minimo", "maximo", "n") %in% colnames(res)))
  expect_equal(nrow(res), 2)

  expect_equal(
    res$media[res$estacion == "NH0046"],
    mean(c(10, 20, 30))
  )
  expect_equal(
    res$minimo[res$estacion == "NH0046"],
    min(c(10, 20, 30))
  )
  expect_equal(
    res$maximo[res$estacion == "NH0046"],
    max(c(10, 20, 30))
  )
  expect_equal(
    res$n[res$estacion == "NH0046"],
    3
  )

  expect_equal(
    res$media[res$estacion == "NH0098"],
    mean(c(5, 15, 25, 35))
  )
  expect_equal(
    res$minimo[res$estacion == "NH0098"],
    min(c(5, 15, 25, 35))
  )
  expect_equal(
    res$maximo[res$estacion == "NH0098"],
    max(c(5, 15, 25, 35))
  )
  expect_equal(
    res$n[res$estacion == "NH0098"],
    4
  )
})

test_that("resumen_temperatura falla si no recibe una lista", {
  expect_error(resumen_temperatura(123))
})

test_that("resumen_temperatura falla si la lista no tiene data frames", {
  expect_error(resumen_temperatura(list("hola")))
})

test_that("resumen_temperatura falla si los data frames no tienen la columna requerida", {
  df_malo <- data.frame(a = 1:5)
  lista <- list(est = df_malo)

  expect_error(resumen_temperatura(lista))
})

test_that("resumen_temperatura ignora elementos que no son data.frame", {

  df_ok <- data.frame(
    temperatura_abrigo_150cm = c(10, 20)
  )

  lista <- list(
    basura1 = "hola",
    NH0046  = df_ok,
    basura2 = 123
  )

  res <- resumen_temperatura(lista)

  expect_true(all(res$estacion == "NH0046"))
  expect_equal(res$n, 2)
})
