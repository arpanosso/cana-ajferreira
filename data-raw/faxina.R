## defininção do PIPE
`%>%` <- magrittr::`%>%`

## criando a função para aquisição dos dados
get_data <- function(plan, path){
  readxl::read_xlsx(path,
                    sheet = plan) %>%
    janitor::clean_names() %>%
    dplyr::mutate(dplyr::across(where(is.character), forcats::as_factor))
}
path <- "data-raw/DADOS_N+MO_SOCA.xlsx"
planilhas <- readxl::excel_sheets(path = path)

## arquivo que recebrá os dados
data_nest <- data.frame(Plan = planilhas) %>%
  dplyr::group_by(Plan) %>%
  tidyr::nest() %>%
  dplyr::mutate(
    data = purrr::map(Plan, get_data,
                      path = "data-raw/DADOS_N+MO_SOCA.xlsx")) %>%
  dplyr::mutate(
    Plan = stringr::str_to_lower(
      stringr::str_replace_all(Plan," ", "_")
    ))
readr::write_rds(data_nest,"data/my_data.rds")
