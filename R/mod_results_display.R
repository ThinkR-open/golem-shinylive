#' results_display UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_results_display_ui <- function(id) {
  ns <- NS(id)
  card(
    div(
      style = "display: flex; flex-direction: column; flex: 1; min-height: calc(100vh - 300px);",
      card_header("Race Results"),
      DT::dataTableOutput(ns("tbl")),
      height = "100%"
    )
  )
}

#' results_display Server Functions
#'
#' @noRd
mod_results_display_server <- function(id, r) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    output$tbl <- DT::renderDataTable({
      to_display <- results
      if (!is.null(r$country) && !("All" %in% r$country)) {
        to_display <- to_display[to_display$Country %in% r$country, ]
      }
      if (!is.null(r$sex) && r$sex != "All") {
        to_display <- to_display[to_display$Sexe %in% r$sex, ]
      }
      to_display$Time <- as.character(to_display$Time)
      DT::datatable(to_display)
    })
  })
}

## To be copied in the UI
# mod_results_display_ui("results_display_1")

## To be copied in the server
# mod_results_display_server("results_display_1")
