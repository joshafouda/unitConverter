#' Convert Distance Between Feet and Meters
#'
#' This function converts a distance value between feet and meters.
#'
#' @param dist_value A numeric value representing the distance to be converted.
#' @param unit_from A character string specifying the unit of the input distance value. Must be either "feet" or "meters".
#' @param unit_to A character string specifying the unit of the output distance value. Must be either "feet" or "meters".
#'
#' @return The converted distance value. If `unit_from` and `unit_to` are the same, the original `dist_value` is returned with a warning.
#'
#' @examples
#' dist_converter(10, "feet", "meters") # Converts 10 feet to meters
#' dist_converter(3.048, "meters", "feet") # Converts 3.048 meters to feet
#' dist_converter(5, "feet", "feet") # Returns 5 with a warning
#'
#' @export
dist_converter <- function(dist_value, unit_from, unit_to) {
  if (unit_from == "feet" && unit_to == "meters") {
    return(dist_value * 0.3048)
  } else if (unit_from == "meters" && unit_to == "feet") {
    return(dist_value / 0.3048)
  } else if (unit_from == unit_to) {
    warning("unit_from and unit_to are the same, returning dist_value")
    return(dist_value)
  } else {
    stop("This function only supports conversions between feet and meters.")
  }
}
