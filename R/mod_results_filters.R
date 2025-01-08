#' results_filters UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_results_filters_ui <- function(id) {
  ns <- NS(id)
  layout_columns(
    col_widths = c(6, 6),
      div(
        style = "display: flex; justify-content: center; align-items: center;",
        selectizeInput(
          ns("country"),
          "Country",
          choices = c(
            "All",
            sort(unique(results$Country))
          )
        ),
        class = "overflow-visible text-center"
      ),
      div(
        style = "display: flex; justify-content: center; align-items: center;",
        selectizeInput(
          ns("sex"),
          "Sexe",
          choices = c(
            "All",
            unique(results$Sexe)
          ),
          selected = ""
        ),
        class = "overflow-visible text-center"
      )
  )
}

#' results_filters Server Functions
#'
#' @noRd
mod_results_filters_server <- function(id, r) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    observe({
      r$country <- input$country
    })
    observe({
      r$sex <- input$sex
    })
  })
}

## To be copied in the UI
# mod_results_filters_ui("results_filters_1")

## To be copied in the server
# mod_results_filters_server("results_filters_1")
