
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Projeto cana Aryane J. Ferreira (IAC)

## Análise Preliminar

### Carregando o banco de dados

``` r
dados <-readr::read_rds("data/my_data.rds")
```

### Resumo estatístico rápido

``` r
dados$data %>% 
  purrr::map(skimr::skim) %>%
  purrr::map_chr(knitr::knit_print, options = list(skimr_include_summary = FALSE)) %>%
  knitr::asis_output()
```

**Variable type: factor**

| skim_variable | n_missing | complete_rate | ordered | n_unique | top_counts                |
|:--------------|----------:|--------------:|:--------|---------:|:--------------------------|
| forma         |         0 |             1 | FALSE   |        3 | fol: 16, Sol: 16, Con: 16 |

**Variable type: numeric**

| skim_variable | n_missing | complete_rate |   mean |    sd |    p0 |    p25 |    p50 |    p75 |   p100 | hist  |
|:--------------|----------:|--------------:|-------:|------:|------:|-------:|-------:|-------:|-------:|:------|
| parcela       |         0 |             1 |  24.50 | 14.00 |  1.00 |  12.75 |  24.50 |  36.25 |  48.00 | ▇▇▇▇▇ |
| dose          |         0 |             1 |  90.00 | 67.79 |  0.00 |  45.00 |  90.00 | 135.00 | 180.00 | ▇▇▁▇▇ |
| bloco         |         0 |             1 |   2.50 |  1.13 |  1.00 |   1.75 |   2.50 |   3.25 |   4.00 | ▇▇▁▇▇ |
| tch           |         0 |             1 | 110.84 | 10.04 | 88.31 | 107.17 | 110.03 | 116.41 | 141.42 | ▃▇▇▂▁ |

**Variable type: factor**

| skim_variable | n_missing | complete_rate | ordered | n_unique | top_counts                |
|:--------------|----------:|--------------:|:--------|---------:|:--------------------------|
| forma         |         0 |             1 | FALSE   |        3 | Fol: 16, Sol: 16, Con: 16 |

**Variable type: numeric**

| skim_variable | n_missing | complete_rate |  mean |    sd |    p0 |   p25 |   p50 |    p75 |   p100 | hist  |
|:--------------|----------:|--------------:|------:|------:|------:|------:|------:|-------:|-------:|:------|
| parcela       |         0 |             1 | 24.50 | 14.00 |  1.00 | 12.75 | 24.50 |  36.25 |  48.00 | ▇▇▇▇▇ |
| dose          |         0 |             1 | 90.00 | 67.79 |  0.00 | 45.00 | 90.00 | 135.00 | 180.00 | ▇▇▁▇▇ |
| bloco         |         0 |             1 |  2.50 |  1.13 |  1.00 |  1.75 |  2.50 |   3.25 |   4.00 | ▇▇▁▇▇ |
| n_1           |         0 |             1 | 19.41 |  0.64 | 18.10 | 19.02 | 19.36 |  19.83 |  20.65 | ▂▃▇▃▃ |
| mo_1          |         0 |             1 |  2.04 |  0.70 |  1.13 |  1.61 |  1.87 |   2.23 |   4.10 | ▇▇▁▁▁ |
| n_2           |         0 |             1 | 20.12 |  0.96 | 17.59 | 19.53 | 20.19 |  20.65 |  22.17 | ▂▃▇▆▃ |
| mo_2          |         0 |             1 |  3.53 |  1.21 |  1.30 |  2.59 |  3.35 |   4.62 |   6.30 | ▅▇▅▆▂ |

**Variable type: factor**

| skim_variable | n_missing | complete_rate | ordered | n_unique | top_counts                |
|:--------------|----------:|--------------:|:--------|---------:|:--------------------------|
| forma         |         0 |             1 | FALSE   |        3 | Fol: 16, Sol: 16, Con: 16 |

**Variable type: numeric**

| skim_variable  | n_missing | complete_rate |   mean |    sd |    p0 |    p25 |    p50 |    p75 |   p100 | hist  |
|:---------------|----------:|--------------:|-------:|------:|------:|-------:|-------:|-------:|-------:|:------|
| parcela        |         0 |             1 |  24.50 | 14.00 |  1.00 |  12.75 |  24.50 |  36.25 |  48.00 | ▇▇▇▇▇ |
| dose           |         0 |             1 |  90.00 | 67.79 |  0.00 |  45.00 |  90.00 | 135.00 | 180.00 | ▇▇▁▇▇ |
| bloco          |         0 |             1 |   2.50 |  1.13 |  1.00 |   1.75 |   2.50 |   3.25 |   4.00 | ▇▇▁▇▇ |
| colmo          |         0 |             1 |  19.42 |  5.06 | 10.41 |  16.10 |  18.50 |  22.47 |  30.84 | ▅▇▇▃▂ |
| ponteiro       |         0 |             1 |  12.94 |  5.29 |  5.05 |   8.71 |  12.55 |  15.62 |  29.72 | ▇▇▅▁▁ |
| palha          |         0 |             1 |  17.08 |  6.96 |  6.96 |  13.23 |  16.14 |  18.90 |  42.52 | ▅▇▁▁▁ |
| extracao_total |         0 |             1 |  49.45 | 10.16 | 29.35 |  43.34 |  48.08 |  53.86 |  73.52 | ▃▇▇▂▂ |
| tch            |         0 |             1 | 110.84 | 10.04 | 88.31 | 107.17 | 110.03 | 116.41 | 141.42 | ▃▇▇▂▁ |
| exportacao_mo  |         0 |             1 |   0.18 |  0.04 |  0.11 |   0.15 |   0.17 |   0.20 |   0.27 | ▅▇▆▂▃ |

**Variable type: factor**

| skim_variable | n_missing | complete_rate | ordered | n_unique | top_counts                |
|:--------------|----------:|--------------:|:--------|---------:|:--------------------------|
| forma         |         0 |             1 | FALSE   |        3 | Fol: 16, Sol: 16, Con: 16 |

**Variable type: numeric**

| skim_variable  | n_missing | complete_rate |   mean |    sd |     p0 |    p25 |    p50 |    p75 |   p100 | hist  |
|:---------------|----------:|--------------:|-------:|------:|-------:|-------:|-------:|-------:|-------:|:------|
| parcela        |         0 |             1 |  24.50 | 14.00 |   1.00 |  12.75 |  24.50 |  36.25 |  48.00 | ▇▇▇▇▇ |
| dose           |         0 |             1 |  90.00 | 67.79 |   0.00 |  45.00 |  90.00 | 135.00 | 180.00 | ▇▇▁▇▇ |
| bloco          |         0 |             1 |   2.50 |  1.13 |   1.00 |   1.75 |   2.50 |   3.25 |   4.00 | ▇▇▁▇▇ |
| colmo          |         0 |             1 |  88.38 | 15.16 |  59.44 |  76.60 |  86.78 |  97.91 | 137.37 | ▅▇▇▁▁ |
| ponteiro       |         0 |             1 |  10.20 |  1.42 |   7.40 |   9.35 |  10.12 |  11.10 |  14.29 | ▃▇▇▃▁ |
| palha          |         0 |             1 |  54.23 | 22.01 |  19.65 |  37.77 |  50.59 |  65.31 | 115.34 | ▆▇▃▂▁ |
| extracao_total |         0 |             1 | 152.82 | 28.42 | 100.92 | 132.92 | 145.83 | 164.37 | 220.97 | ▃▇▆▂▂ |
| tch            |         0 |             1 | 110.84 | 10.04 |  88.31 | 107.17 | 110.03 | 116.41 | 141.42 | ▃▇▇▂▁ |
| exportacao_n   |         0 |             1 |   0.80 |  0.12 |   0.62 |   0.71 |   0.80 |   0.84 |   1.20 | ▅▇▂▁▁ |

**Variable type: factor**

| skim_variable | n_missing | complete_rate | ordered | n_unique | top_counts                |
|:--------------|----------:|--------------:|:--------|---------:|:--------------------------|
| forma         |         0 |             1 | FALSE   |        3 | Con: 16, fol: 16, Sol: 16 |

**Variable type: numeric**

| skim_variable     | n_missing | complete_rate |  mean |    sd |   p0 |   p25 |   p50 |    p75 |   p100 | hist  |
|:------------------|----------:|--------------:|------:|------:|-----:|------:|------:|-------:|-------:|:------|
| parcela           |         0 |             1 | 24.50 | 14.00 | 1.00 | 12.75 | 24.50 |  36.25 |  48.00 | ▇▇▇▇▇ |
| dose              |         0 |             1 | 90.00 | 67.79 | 0.00 | 45.00 | 90.00 | 135.00 | 180.00 | ▇▇▁▇▇ |
| bloco             |         0 |             1 |  2.44 |  1.13 | 1.00 |  1.00 |  2.00 |   3.00 |   4.00 | ▇▇▁▇▇ |
| redutase_1\_epoca |         0 |             1 |  0.65 |  0.10 | 0.41 |  0.60 |  0.64 |   0.72 |   0.89 | ▂▃▇▃▁ |
| redutase_2\_epoca |         0 |             1 |  0.73 |  0.24 | 0.41 |  0.60 |  0.66 |   0.74 |   1.53 | ▅▇▁▁▁ |
| raiz              |         0 |             1 |  0.22 |  0.02 | 0.19 |  0.20 |  0.21 |   0.23 |   0.29 | ▇▅▂▂▁ |

**Variable type: factor**

| skim_variable | n_missing | complete_rate | ordered | n_unique | top_counts                |
|:--------------|----------:|--------------:|:--------|---------:|:--------------------------|
| forma         |         0 |             1 | FALSE   |        3 | fol: 16, Sol: 16, Con: 16 |

**Variable type: numeric**

| skim_variable | n_missing | complete_rate |   mean |    sd |     p0 |    p25 |    p50 |    p75 |   p100 | hist  |
|:--------------|----------:|--------------:|-------:|------:|-------:|-------:|-------:|-------:|-------:|:------|
| parcela       |         0 |             1 |  24.50 | 14.00 |   1.00 |  12.75 |  24.50 |  36.25 |  48.00 | ▇▇▇▇▇ |
| dose          |         0 |             1 |  90.00 | 67.79 |   0.00 |  45.00 |  90.00 | 135.00 | 180.00 | ▇▇▁▇▇ |
| bloco         |         0 |             1 |   2.50 |  1.13 |   1.00 |   1.75 |   2.50 |   3.25 |   4.00 | ▇▇▁▇▇ |
| tch           |         0 |             1 | 110.84 | 10.04 |  88.31 | 107.17 | 110.03 | 116.41 | 141.42 | ▃▇▇▂▁ |
| atr           |         0 |             1 | 129.19 |  3.92 | 121.02 | 126.76 | 128.86 | 132.21 | 137.48 | ▃▇▇▇▃ |
| tah           |         0 |             1 |  14.31 |  1.32 |  11.35 |  13.77 |  14.25 |  15.14 |  17.27 | ▂▂▇▅▂ |

### Gráficos boxplot

``` r
dados <- dados %>% 
  dplyr::mutate(
    boxplot = purrr::map(data, my_summary, type="boxplot"),
    histograma = purrr::map(data, my_summary,type="histograma"),
    anova = purrr::map(data, my_summary,type="regressao")
  )
dados$boxplot
#> [[1]]
#> [[1]][[1]]
```

![](README_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

    #> 
    #> 
    #> [[2]]
    #> [[2]][[1]]

![](README_files/figure-gfm/unnamed-chunk-4-2.png)<!-- -->

    #> 
    #> [[2]][[2]]

![](README_files/figure-gfm/unnamed-chunk-4-3.png)<!-- -->

    #> 
    #> [[2]][[3]]

![](README_files/figure-gfm/unnamed-chunk-4-4.png)<!-- -->

    #> 
    #> [[2]][[4]]

![](README_files/figure-gfm/unnamed-chunk-4-5.png)<!-- -->

    #> 
    #> 
    #> [[3]]
    #> [[3]][[1]]

![](README_files/figure-gfm/unnamed-chunk-4-6.png)<!-- -->

    #> 
    #> [[3]][[2]]

![](README_files/figure-gfm/unnamed-chunk-4-7.png)<!-- -->

    #> 
    #> [[3]][[3]]

![](README_files/figure-gfm/unnamed-chunk-4-8.png)<!-- -->

    #> 
    #> [[3]][[4]]

![](README_files/figure-gfm/unnamed-chunk-4-9.png)<!-- -->

    #> 
    #> [[3]][[5]]

![](README_files/figure-gfm/unnamed-chunk-4-10.png)<!-- -->

    #> 
    #> [[3]][[6]]

![](README_files/figure-gfm/unnamed-chunk-4-11.png)<!-- -->

    #> 
    #> 
    #> [[4]]
    #> [[4]][[1]]

![](README_files/figure-gfm/unnamed-chunk-4-12.png)<!-- -->

    #> 
    #> [[4]][[2]]

![](README_files/figure-gfm/unnamed-chunk-4-13.png)<!-- -->

    #> 
    #> [[4]][[3]]

![](README_files/figure-gfm/unnamed-chunk-4-14.png)<!-- -->

    #> 
    #> [[4]][[4]]

![](README_files/figure-gfm/unnamed-chunk-4-15.png)<!-- -->

    #> 
    #> [[4]][[5]]

![](README_files/figure-gfm/unnamed-chunk-4-16.png)<!-- -->

    #> 
    #> [[4]][[6]]

![](README_files/figure-gfm/unnamed-chunk-4-17.png)<!-- -->

    #> 
    #> 
    #> [[5]]
    #> [[5]][[1]]

![](README_files/figure-gfm/unnamed-chunk-4-18.png)<!-- -->

    #> 
    #> [[5]][[2]]

![](README_files/figure-gfm/unnamed-chunk-4-19.png)<!-- -->

    #> 
    #> [[5]][[3]]

![](README_files/figure-gfm/unnamed-chunk-4-20.png)<!-- -->

    #> 
    #> 
    #> [[6]]
    #> [[6]][[1]]

![](README_files/figure-gfm/unnamed-chunk-4-21.png)<!-- -->

    #> 
    #> [[6]][[2]]

![](README_files/figure-gfm/unnamed-chunk-4-22.png)<!-- -->

    #> 
    #> [[6]][[3]]

![](README_files/figure-gfm/unnamed-chunk-4-23.png)<!-- -->

``` r
dados$anova
#> [[1]]
#> [[1]][[1]]
#> Analysis of Variance Table
#> 
#> Response: tch
#>            Df  Sum Sq Mean Sq F value  Pr(>F)  
#> bloco       3  121.74   40.58  0.4907 0.69113  
#> dose        3  594.87  198.29  2.3979 0.08567 .
#> forma       2  686.19  343.09  4.1490 0.02470 *
#> dose:forma  6  603.49  100.58  1.2163 0.32284  
#> Residuals  33 2728.87   82.69                  
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> 
#> [[2]]
#> [[2]][[1]]
#> Analysis of Variance Table
#> 
#> Response: n_1
#>            Df Sum Sq Mean Sq F value    Pr(>F)    
#> bloco       3 1.3731 0.45771  3.2765 0.0331092 *  
#> dose        3 8.7088 2.90292 20.7804 9.603e-08 ***
#> forma       2 0.0336 0.01681  0.1203 0.8870355    
#> dose:forma  6 4.2673 0.71122  5.0913 0.0008524 ***
#> Residuals  33 4.6099 0.13970                      
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> [[2]][[2]]
#> Analysis of Variance Table
#> 
#> Response: mo_1
#>            Df Sum Sq Mean Sq F value    Pr(>F)    
#> bloco       3 0.6002  0.2001  0.7098   0.55306    
#> dose        3 2.0682  0.6894  2.4458   0.08127 .  
#> forma       2 8.3199  4.1599 14.7586 2.639e-05 ***
#> dose:forma  6 2.8027  0.4671  1.6572   0.16283    
#> Residuals  33 9.3016  0.2819                      
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> [[2]][[3]]
#> Analysis of Variance Table
#> 
#> Response: n_2
#>            Df Sum Sq Mean Sq F value Pr(>F)
#> bloco       3  1.257 0.41887  0.3819 0.7667
#> dose        3  1.859 0.61957  0.5649 0.6420
#> forma       2  0.885 0.44271  0.4036 0.6712
#> dose:forma  6  3.302 0.55035  0.5018 0.8024
#> Residuals  33 36.196 1.09685               
#> 
#> [[2]][[4]]
#> Analysis of Variance Table
#> 
#> Response: mo_2
#>            Df  Sum Sq Mean Sq F value    Pr(>F)    
#> bloco       3  0.5179  0.1726  0.3136  0.815409    
#> dose        3  6.1173  2.0391  3.7040  0.021130 *  
#> forma       2 29.0601 14.5301 26.3938 1.426e-07 ***
#> dose:forma  6 15.1485  2.5247  4.5862  0.001731 ** 
#> Residuals  33 18.1668  0.5505                      
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> 
#> [[3]]
#> [[3]][[1]]
#> Analysis of Variance Table
#> 
#> Response: colmo
#>            Df Sum Sq Mean Sq F value    Pr(>F)    
#> bloco       3  63.03  21.010  1.4138    0.2562    
#> dose        3  49.00  16.334  1.0991    0.3633    
#> forma       2 488.35 244.177 16.4304 1.117e-05 ***
#> dose:forma  6 112.35  18.725  1.2600    0.3024    
#> Residuals  33 490.42  14.861                      
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> [[3]][[2]]
#> Analysis of Variance Table
#> 
#> Response: ponteiro
#>            Df Sum Sq Mean Sq F value   Pr(>F)   
#> bloco       3   6.10   2.035  0.1101 0.953572   
#> dose        3  64.14  21.380  1.1573 0.340732   
#> forma       2 217.88 108.941  5.8969 0.006462 **
#> dose:forma  6 416.22  69.370  3.7550 0.005869 **
#> Residuals  33 609.65  18.474                    
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> [[3]][[3]]
#> Analysis of Variance Table
#> 
#> Response: palha
#>            Df  Sum Sq Mean Sq F value  Pr(>F)  
#> bloco       3  442.38 147.459  4.1272 0.01367 *
#> dose        3   75.51  25.171  0.7045 0.55616  
#> forma       2   59.44  29.719  0.8318 0.44419  
#> dose:forma  6  521.51  86.918  2.4327 0.04663 *
#> Residuals  33 1179.05  35.729                  
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> [[3]][[4]]
#> Analysis of Variance Table
#> 
#> Response: extracao_total
#>            Df  Sum Sq Mean Sq F value   Pr(>F)   
#> bloco       3  645.90  215.30  3.7590 0.019956 * 
#> dose        3  112.14   37.38  0.6526 0.586983   
#> forma       2  839.99  419.99  7.3329 0.002318 **
#> dose:forma  6 1360.36  226.73  3.9586 0.004324 **
#> Residuals  33 1890.08   57.28                    
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> [[3]][[5]]
#> Analysis of Variance Table
#> 
#> Response: tch
#>            Df  Sum Sq Mean Sq F value  Pr(>F)  
#> bloco       3  121.74   40.58  0.4907 0.69113  
#> dose        3  594.87  198.29  2.3979 0.08567 .
#> forma       2  686.19  343.09  4.1490 0.02470 *
#> dose:forma  6  603.49  100.58  1.2163 0.32284  
#> Residuals  33 2728.87   82.69                  
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> [[3]][[6]]
#> Analysis of Variance Table
#> 
#> Response: exportacao_mo
#>            Df   Sum Sq   Mean Sq F value    Pr(>F)    
#> bloco       3 0.003382 0.0011274  1.0041 0.4032485    
#> dose        3 0.007855 0.0026185  2.3321 0.0921148 .  
#> forma       2 0.027653 0.0138267 12.3144 0.0001011 ***
#> dose:forma  6 0.014659 0.0024432  2.1759 0.0706046 .  
#> Residuals  33 0.037053 0.0011228                      
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> 
#> [[4]]
#> [[4]][[1]]
#> Analysis of Variance Table
#> 
#> Response: colmo
#>            Df Sum Sq Mean Sq F value Pr(>F)
#> bloco       3  261.9   87.30  0.3901 0.7609
#> dose        3 1266.0  422.00  1.8859 0.1512
#> forma       2  394.6  197.31  0.8818 0.4236
#> dose:forma  6 1499.7  249.94  1.1170 0.3738
#> Residuals  33 7384.3  223.77               
#> 
#> [[4]][[2]]
#> Analysis of Variance Table
#> 
#> Response: ponteiro
#>            Df Sum Sq Mean Sq F value  Pr(>F)  
#> bloco       3  4.424  1.4747  0.7386 0.53659  
#> dose        3 17.667  5.8890  2.9494 0.04697 *
#> forma       2  1.271  0.6355  0.3183 0.72960  
#> dose:forma  6  5.117  0.8528  0.4271 0.85551  
#> Residuals  33 65.889  1.9966                  
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> [[4]][[3]]
#> Analysis of Variance Table
#> 
#> Response: palha
#>            Df  Sum Sq Mean Sq F value    Pr(>F)    
#> bloco       3   877.6  292.54  0.9245 0.4397857    
#> dose        3   519.0  173.01  0.5467 0.6538306    
#> forma       2   557.3  278.64  0.8806 0.4240688    
#> dose:forma  6 10374.6 1729.09  5.4642 0.0005133 ***
#> Residuals  33 10442.5  316.44                      
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> [[4]][[4]]
#> Analysis of Variance Table
#> 
#> Response: extracao_total
#>            Df  Sum Sq Mean Sq F value   Pr(>F)   
#> bloco       3   389.8  129.95  0.2398 0.867963   
#> dose        3  3771.3 1257.09  2.3195 0.093403 . 
#> forma       2   658.2  329.08  0.6072 0.550845   
#> dose:forma  6 15259.0 2543.17  4.6925 0.001488 **
#> Residuals  33 17884.7  541.96                    
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> [[4]][[5]]
#> Analysis of Variance Table
#> 
#> Response: tch
#>            Df  Sum Sq Mean Sq F value  Pr(>F)  
#> bloco       3  121.74   40.58  0.4907 0.69113  
#> dose        3  594.87  198.29  2.3979 0.08567 .
#> forma       2  686.19  343.09  4.1490 0.02470 *
#> dose:forma  6  603.49  100.58  1.2163 0.32284  
#> Residuals  33 2728.87   82.69                  
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> [[4]][[6]]
#> Analysis of Variance Table
#> 
#> Response: exportacao_n
#>            Df  Sum Sq   Mean Sq F value Pr(>F)
#> bloco       3 0.00924 0.0030787  0.1972 0.8976
#> dose        3 0.05211 0.0173702  1.1125 0.3580
#> forma       2 0.00149 0.0007448  0.0477 0.9535
#> dose:forma  6 0.09257 0.0154282  0.9882 0.4492
#> Residuals  33 0.51523 0.0156130               
#> 
#> 
#> [[5]]
#> [[5]][[1]]
#> Analysis of Variance Table
#> 
#> Response: redutase_1_epoca
#>            Df  Sum Sq   Mean Sq F value Pr(>F)
#> bloco       3 0.01704 0.0056786  0.5558 0.6479
#> dose        3 0.00153 0.0005088  0.0498 0.9850
#> forma       2 0.03241 0.0162048  1.5862 0.2199
#> dose:forma  6 0.09090 0.0151499  1.4829 0.2145
#> Residuals  33 0.33714 0.0102164               
#> 
#> [[5]][[2]]
#> Analysis of Variance Table
#> 
#> Response: redutase_2_epoca
#>            Df  Sum Sq  Mean Sq F value    Pr(>F)    
#> bloco       3 0.05153 0.017175  0.4844 0.6953835    
#> dose        3 0.74137 0.247124  6.9704 0.0009257 ***
#> forma       2 0.32018 0.160092  4.5155 0.0184743 *  
#> dose:forma  6 0.50186 0.083644  2.3593 0.0524933 .  
#> Residuals  33 1.16997 0.035454                      
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> [[5]][[3]]
#> Analysis of Variance Table
#> 
#> Response: raiz
#>            Df    Sum Sq    Mean Sq F value Pr(>F)
#> bloco       3 0.0009556 0.00031852  0.5331 0.6628
#> dose        3 0.0040072 0.00133575  2.2356 0.1025
#> forma       2 0.0011772 0.00058861  0.9851 0.3841
#> dose:forma  6 0.0030486 0.00050810  0.8504 0.5409
#> Residuals  33 0.0197169 0.00059748               
#> 
#> 
#> [[6]]
#> [[6]][[1]]
#> Analysis of Variance Table
#> 
#> Response: tch
#>            Df  Sum Sq Mean Sq F value  Pr(>F)  
#> bloco       3  121.74   40.58  0.4907 0.69113  
#> dose        3  594.87  198.29  2.3979 0.08567 .
#> forma       2  686.19  343.09  4.1490 0.02470 *
#> dose:forma  6  603.49  100.58  1.2163 0.32284  
#> Residuals  33 2728.87   82.69                  
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> [[6]][[2]]
#> Analysis of Variance Table
#> 
#> Response: atr
#>            Df Sum Sq Mean Sq F value Pr(>F)  
#> bloco       3  29.72   9.908  0.7056 0.5555  
#> dose        3  52.80  17.600  1.2534 0.3063  
#> forma       2 111.75  55.875  3.9791 0.0283 *
#> dose:forma  6  64.76  10.794  0.7687 0.5999  
#> Residuals  33 463.38  14.042                 
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> [[6]][[3]]
#> Analysis of Variance Table
#> 
#> Response: tah
#>            Df Sum Sq Mean Sq F value   Pr(>F)   
#> bloco       3  0.834  0.2780  0.2126 0.886969   
#> dose        3  7.724  2.5746  1.9687 0.137837   
#> forma       2 19.927  9.9634  7.6186 0.001904 **
#> dose:forma  6  9.659  1.6098  1.2310 0.315842   
#> Residuals  33 43.157  1.3078                    
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```
