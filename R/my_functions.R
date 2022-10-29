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

my_interaction <- function(nomes_vars, df){
  library(patchwork)
  df <- df %>% dplyr::select(dose,forma,nomes_vars)
  names(df) <- c("dose","forma","Y")
  pl1<-df %>%
    dplyr::group_by(dose, forma) %>%
    dplyr::summarise(
      Y = mean(Y), .groups = 'drop'
    ) %>%
    ggplot2::ggplot(ggplot2::aes(x= dose,
                                 y = Y,
                                 color=forma)) +
    ggplot2::geom_point(size=2) +
    ggplot2::geom_line() +
    ggplot2::theme_minimal() +
    ggplot2::labs(y=nomes_vars)+
    ggplot2::scale_color_viridis_d()

  pl2<-df %>%
    dplyr::mutate(
      dose = as.factor(dose)
    ) %>%
    dplyr::group_by(dose, forma) %>%
    dplyr::summarise(
      Y = mean(Y), .groups = 'drop'
    ) %>%
    ggplot2::ggplot(ggplot2::aes(x= forma,
                                 y = Y,
                                 fill=dose)) +
    ggplot2::geom_col(position="dodge") +
    ggplot2::theme_minimal() +
    ggplot2::labs(y=nomes_vars,fill="dose")+
    ggplot2::scale_fill_viridis_d()
  pl1/pl2

}

my_reg <- function(nomes_vars, df){
  formula <- (paste0(nomes_vars,"~","bloco + dose*forma"))
  mod <- lm(formula,
            data=df %>%
              dplyr::mutate(dose = forcats::as_factor(dose),
                            bloco = forcats::as_factor(bloco))
  ) %>% anova()
}

my_desdobramento <- function(nomes_vars, df){
  df <- df %>% dplyr::select(dose,forma,bloco,nomes_vars)
  names(df) <- c("dose","forma","bloco","Y")
  dose <- df$dose
  forma <- df$forma
  bloco <- df$bloco
  Y<-df$Y
  print(paste0("Variavel: ",nomes_vars))
  ExpDes.pt::fat2.dbc(dose,forma,bloco,resp = Y,
                      quali = c(FALSE,TRUE),
                      mcomp = "lsd",
                      fac.names = c("Dose","Forma"),
                      sigT = .10,
                      sigF = 0.35)
}


my_summary <- function(df, type=""){
  nomes_vars <- df %>%
    dplyr::select((where(is.numeric)),-(parcela:bloco)) %>%
    names()
  if(type == "boxplot") purrr::map(nomes_vars, my_boxplot, df)
  else if(type == "histograma") purrr::map(nomes_vars, my_histograma, df)
  else if(type == "regressao") purrr::map(nomes_vars, my_reg, df)
  else if(type == "interacao") purrr::map(nomes_vars, my_interaction, df)
  else if(type == "desdobramento") purrr::map(nomes_vars, my_desdobramento, df)
}

