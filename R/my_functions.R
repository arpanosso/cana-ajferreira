my_boxplot <- function(nomes_vars, df){
  df %>%
    ggplot2::ggplot(ggplot2::aes_string(x= "dose",
                                        y = nomes_vars,
                                        fill="forma")) +
    ggplot2::geom_boxplot(width=.1) +
    ggplot2::theme_minimal() +
    ggplot2::scale_fill_viridis_d()
}

my_histograma <- function(nomes_vars, df){
  df %>%
    ggplot2::ggplot(ggplot2::aes_string(x= nomes_vars)) +
    ggplot2::geom_histogram(bins = 12,
                            color="black",
                            fill="aquamarine4") +
    ggplot2::theme_minimal()
}

my_reg <- function(nomes_vars, df){
  formula <- (paste0(nomes_vars,"~","bloco + dose*forma"))
  mod <- lm(formula,
            data=df %>%
              dplyr::mutate(dose = forcats::as_factor(dose),
                            bloco = forcats::as_factor(bloco))
  ) %>% anova()
}

my_summary <- function(df, type=""){
  nomes_vars <- df %>%
    dplyr::select((where(is.numeric)),-(parcela:bloco)) %>%
    names()
  if(type == "boxplot") purrr::map(nomes_vars, my_boxplot, df)
  else if(type == "histograma") purrr::map(nomes_vars, my_histograma, df)
  else if(type == "regressao") purrr::map(nomes_vars, my_reg, df)
}

