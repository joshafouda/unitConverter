#' Convert Time Between Hours, Minutes, and Seconds
#'
#' This function converts a time value between hours, minutes, and seconds.
#'
#' @param time A numeric value representing the time to be converted.
#' @param unit_from A character string specifying the unit of the input time value. Must be one of "hours", "minutes", or "seconds".
#' @param unit_to A character string specifying the unit of the output time value. Must be one of "hours", "minutes", or "seconds".
#'
#' @return The converted time value. If `unit_from` and `unit_to` are the same, the original `time` is returned.
#' @examples
#' time_converter(2, "hours", "minutes") # Converts 2 hours to minutes
#' time_converter(120, "minutes", "hours") # Converts 120 minutes to hours
#' time_converter(3600, "seconds", "hours") # Converts 3600 seconds to hours
#' time_converter(45, "minutes", "minutes") # Returns 45 (no conversion needed)
#'
#' @export
time_converter <- function(time, unit_from, unit_to) {
  if ((unit_from == "hours" && unit_to == "minutes") || (unit_from == "minutes" && unit_to == "seconds")) {
    return(time * 60)
  } else if ((unit_from == "minutes" && unit_to == "hours") || (unit_from == "seconds" && unit_to == "minutes")) {
    return(time / 60)
  } else if (unit_from == "hours" && unit_to == "seconds") {
    return(time * 3600)
  } else if (unit_from == "seconds" && unit_to == "hours") {
    return(time / 3600)
  } else {
    return(time)  # No conversion needed
  }
}
