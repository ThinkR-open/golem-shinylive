## code to prepare `DATASET` dataset goes here

r <- rvest::read_html("http://runraid.free.fr/courses/classements.php?annee=2024&course=diagonale")
r |>
  rvest::html_table() -> res
results <- res[[18]][-1, ] |>
  dplyr::select(
    Rank = Place,
    Name = Nom,
    Time = Temps,
    Country = Club,
    Sexe = Sexe,
    Bib = `N°`
  ) |>
  dplyr::mutate(
    Time = lubridate::hms(Time)
  )
usethis::use_data(results, overwrite = TRUE)
