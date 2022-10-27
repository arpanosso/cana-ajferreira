my_boxplot <- function(nomes_vars,df){
  df %>%
    ggplot2::ggplot(ggplot2::aes_string(x= "dose",
                                        y = nomes_vars,
                                        fill="forma")) +
    ggplot2::geom_boxplot(width=.1) +
    ggplot2::theme_minimal() +
    ggplot2::scale_fill_viridis_d()
}

my_summary <- function(df){
  nomes_vars <- df %>%
    dplyr::select((where(is.numeric)),-(parcela:bloco)) %>%
    names()
  purrr::map(nomes_vars, my_boxplot, df)
}
