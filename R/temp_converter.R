#' Convert Temperature Between Celsius and Fahrenheit
#'
#' This function converts a temperature value between Celsius and Fahrenheit.
#'
#' @param value A numeric value representing the temperature to be converted.
#' @param unit_from A character string specifying the unit of the input temperature value. Must be either "Celsius" or "Fahrenheit". Default is "Celsius".
#' @param unit_to A character string specifying the unit of the output temperature value. Must be either "Celsius" or "Fahrenheit". Default is "Fahrenheit".
#'
#' @return The converted temperature value. If `unit_from` and `unit_to` are the same, the original `value` is returned with a warning.
#' @seealso \link[base]{stop}, \link[base]{warning}
#' @examples
#' temp_converter(0, "Celsius", "Fahrenheit") # Converts 0 Celsius to Fahrenheit
#' temp_converter(32, "Fahrenheit", "Celsius") # Converts 32 Fahrenheit to Celsius
#' temp_converter(100, "Celsius", "Celsius") # Returns 100 with a warning
#'
#' @export
temp_converter <- function(value, unit_from = "Celsius", unit_to = "Fahrenheit") {
  if (unit_from == "Celsius" && unit_to == "Fahrenheit") {
    return(value * 9 / 5 + 32)
  } else if (unit_from == "Fahrenheit" && unit_to == "Celsius") {
    return((value - 32) * 5 / 9)
  } else if (unit_from == unit_to) {
    warning("unit_from and unit_to are the same, value returned.")
    return(value)
  } else {
    stop("Invalid unit_from or unit_to. Only 'Celsius' and 'Fahrenheit' are accepted.")
  }
}
