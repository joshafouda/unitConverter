#' Convert Weight Between Grams, Kilograms, Pounds, and Ounces
#'
#' This function converts a weight value between grams, kilograms, pounds, and ounces.
#'
#' @param weight_value A numeric value representing the weight to be converted.
#' @param unit_from A character string specifying the unit of the input weight value. Must be one of "gram", "kilogram", "pound", or "ounce".
#' @param unit_to A character string specifying the unit of the output weight value. Must be one of "gram", "kilogram", "pound", or "ounce".
#'
#' @return The converted weight value.
#' @examples
#' weight_converter(1000, "gram", "kilogram") # Converts 1000 grams to kilograms
#' weight_converter(2.2, "pound", "kilogram") # Converts 2.2 pounds to kilograms
#' weight_converter(500, "ounce", "gram") # Converts 500 ounces to grams
#'
#' @export
weight_converter <- function(weight_value, unit_from, unit_to) {
  # Conversion factors for different weight units
  conversion_factors <- c(gram = 1, kilogram = 1000,
                          pound = 453.592, ounce = 28.3495)

  # Check if specified units are valid
  if (!unit_from %in% names(conversion_factors) || !unit_to %in% names(conversion_factors)) {
    stop("Invalid unit_from or unit_to. Accepted units are 'gram', 'kilogram', 'pound', 'ounce'.")
  }

  # Convert the value from the original unit to grams
  in_grams <- weight_value * conversion_factors[unit_from]

  # Convert the value from grams to the destination unit
  return(unname(in_grams / conversion_factors[unit_to]))
}
