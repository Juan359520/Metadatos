
#' Convierte pulgadas a centímetros
#'
#' @param pulgadas Valor numérico en pulgadas.
#' @return Valor numérico en centímetros.
#' @examples
#' pulgadas_a_centimetros(10)
#' @export
centimetros_a_pulgadas <- function(pulgadas) {
  if (!is.numeric(pulgadas)) {
    stop("El valor debe ser numérico.")
  }
  return(pulgadas * 2.54)
}

