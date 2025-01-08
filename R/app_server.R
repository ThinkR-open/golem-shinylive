#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  r <- reactiveValues()
  mod_results_filters_server("results_filters_1", r = r)
  mod_results_display_server("results_display_1", r = r)
}
