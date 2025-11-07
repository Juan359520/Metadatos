test_that("convierte correctamente de centimetros a pulgadas", {
  expect_equal(centimetros_a_pulgadas(1), 2.54)
  expect_equal(centimetros_a_pulgadas(0), 0)
  expect_equal(centimetros_a_pulgadas(c(1, 2)), c(2.54, 5.08))
})

test_that("lanza error si el argumento no es numérico", {
  expect_error(centimetros_a_pulgadas("a"), "El valor debe ser numérico")
})

