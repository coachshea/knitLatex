---
title: "xTab"
author: "John Shea"
date: "2015-06-18"
output:
  rmarkdown::html_vignette:
    toc: true
vignette: >
  %\VignetteIndexEntry{xTab}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---



# Introduction

xTab is a function the produces a standard latex table/tabular environment

For all of the examples that follow, we will be using the first ten rows and
five columns of the mtcars data.frame, which we have saved in the variable
'cars'.

**Important Notes**

* When passing latex commands to an xTab argument, backslashes must be escaped.
  For example, you need to pass '\\\\hline' to produce '\\hline' in the latex
  document. Similarly you must pass'\\\\\\\\' to produce '\\\\'.
* The following examples write the latex tables to stdout for demonstration
  purposes. To see an actual .Rnw file, and the resultant pdf file select the
  links below. The pdf file is written to be a knitLatex tutorial in and of
  itself. However, reading the .Rnw file can provide further insight into the
  uses of this package.
    + [example.Rnw](../examples/example.Rnw)
    + [example.pdf](../examples/example.pdf)

# Basics

## Standard xTab table

To produce a latex table, simply pass a matrix or a data.frame to the xTab
function.


```r
xTab(cars)
## \begin{table}[ht]
## \begin{center}
## \begin{tabular}{rrrrr}
## \hline
## mpg & cyl & disp & hp & drat \\
## \hline
## 21 & 6 & 160 & 110 & 3.9 \\
## 21 & 6 & 160 & 110 & 3.9 \\
## 22.8 & 4 & 108 & 93 & 3.85 \\
## 21.4 & 6 & 258 & 110 & 3.08 \\
## 18.7 & 8 & 360 & 175 & 3.15 \\
## 18.1 & 6 & 225 & 105 & 2.76 \\
## 14.3 & 8 & 360 & 245 & 3.21 \\
## 24.4 & 4 & 146.7 & 62 & 3.69 \\
## 22.8 & 4 & 140.8 & 95 & 3.92 \\
## 19.2 & 6 & 167.6 & 123 & 3.92 \\
## \hline
## \end{tabular}
## \end{center}
## \end{table}
```

## Labels

Pass a string into the 'label' option. When not set, defaults to NULL.


```r
xTab(cars, label = 'tab:mytable')
## \begin{table}[ht]
## \begin{center}
## \begin{tabular}{rrrrr}
## \hline
## mpg & cyl & disp & hp & drat \\
## \hline
## 21 & 6 & 160 & 110 & 3.9 \\
## 21 & 6 & 160 & 110 & 3.9 \\
## 22.8 & 4 & 108 & 93 & 3.85 \\
## 21.4 & 6 & 258 & 110 & 3.08 \\
## 18.7 & 8 & 360 & 175 & 3.15 \\
## 18.1 & 6 & 225 & 105 & 2.76 \\
## 14.3 & 8 & 360 & 245 & 3.21 \\
## 24.4 & 4 & 146.7 & 62 & 3.69 \\
## 22.8 & 4 & 140.8 & 95 & 3.92 \\
## 19.2 & 6 & 167.6 & 123 & 3.92 \\
## \hline
## \end{tabular}
## \label{tab:mytable}
## \end{center}
## \end{table}
```

## Captions

Place a caption at the top of the table.


```r
xTab(cars, caption.top = 'my table')
## \begin{table}[ht]
## \begin{center}
## \caption{my table}
## \begin{tabular}{rrrrr}
## \hline
## mpg & cyl & disp & hp & drat \\
## \hline
## 21 & 6 & 160 & 110 & 3.9 \\
## 21 & 6 & 160 & 110 & 3.9 \\
## 22.8 & 4 & 108 & 93 & 3.85 \\
## 21.4 & 6 & 258 & 110 & 3.08 \\
## 18.7 & 8 & 360 & 175 & 3.15 \\
## 18.1 & 6 & 225 & 105 & 2.76 \\
## 14.3 & 8 & 360 & 245 & 3.21 \\
## 24.4 & 4 & 146.7 & 62 & 3.69 \\
## 22.8 & 4 & 140.8 & 95 & 3.92 \\
## 19.2 & 6 & 167.6 & 123 & 3.92 \\
## \hline
## \end{tabular}
## \end{center}
## \end{table}
```

Place a caption at the bottom of the table


```r
xTab(cars, caption.bottom = 'my table')
## \begin{table}[ht]
## \begin{center}
## \begin{tabular}{rrrrr}
## \hline
## mpg & cyl & disp & hp & drat \\
## \hline
## 21 & 6 & 160 & 110 & 3.9 \\
## 21 & 6 & 160 & 110 & 3.9 \\
## 22.8 & 4 & 108 & 93 & 3.85 \\
## 21.4 & 6 & 258 & 110 & 3.08 \\
## 18.7 & 8 & 360 & 175 & 3.15 \\
## 18.1 & 6 & 225 & 105 & 2.76 \\
## 14.3 & 8 & 360 & 245 & 3.21 \\
## 24.4 & 4 & 146.7 & 62 & 3.69 \\
## 22.8 & 4 & 140.8 & 95 & 3.92 \\
## 19.2 & 6 & 167.6 & 123 & 3.92 \\
## \hline
## \end{tabular}
## \caption{my table}
## \end{center}
## \end{table}
```

## Booktabs

Setting booktabs = TRUE sets the defaults of the toprule, midrule, and
bottomrule arguments to \\toprule, \\midrule, and \\bottomrule respectively.
When using booktabs rules, regardless of whether you set booktabs = TRUE or set
them individually, make sure to include \\usepackage{booktabs} in your latex
document. When booktabs is not set, xTab looks for the value of
kLat.xTab.booktabs, then kLat.booktabs, then defaults to FALSE.


```r
xTab(cars, booktabs = TRUE)
## \begin{table}[ht]
## \begin{center}
## \begin{tabular}{rrrrr}
## \toprule
## mpg & cyl & disp & hp & drat \\
## \midrule
## 21 & 6 & 160 & 110 & 3.9 \\
## 21 & 6 & 160 & 110 & 3.9 \\
## 22.8 & 4 & 108 & 93 & 3.85 \\
## 21.4 & 6 & 258 & 110 & 3.08 \\
## 18.7 & 8 & 360 & 175 & 3.15 \\
## 18.1 & 6 & 225 & 105 & 2.76 \\
## 14.3 & 8 & 360 & 245 & 3.21 \\
## 24.4 & 4 & 146.7 & 62 & 3.69 \\
## 22.8 & 4 & 140.8 & 95 & 3.92 \\
## 19.2 & 6 & 167.6 & 123 & 3.92 \\
## \bottomrule
## \end{tabular}
## \end{center}
## \end{table}
```

If any of those options are explicitly set, the booktabs value has no effect. 


```r
xTab(cars, booktabs = TRUE, midrule = '\\hline')
## \begin{table}[ht]
## \begin{center}
## \begin{tabular}{rrrrr}
## \toprule
## mpg & cyl & disp & hp & drat \\
## \hline
## 21 & 6 & 160 & 110 & 3.9 \\
## 21 & 6 & 160 & 110 & 3.9 \\
## 22.8 & 4 & 108 & 93 & 3.85 \\
## 21.4 & 6 & 258 & 110 & 3.08 \\
## 18.7 & 8 & 360 & 175 & 3.15 \\
## 18.1 & 6 & 225 & 105 & 2.76 \\
## 14.3 & 8 & 360 & 245 & 3.21 \\
## 24.4 & 4 & 146.7 & 62 & 3.69 \\
## 22.8 & 4 & 140.8 & 95 & 3.92 \\
## 19.2 & 6 & 167.6 & 123 & 3.92 \\
## \bottomrule
## \end{tabular}
## \end{center}
## \end{table}
```

## Table Position

If not set, xTAb will look for the value of kLat.xTab.position. If not set,
defaults to 'ht'


```r
xTab(cars, position = '!htbp')
## \begin{table}[!htbp]
## \begin{center}
## \begin{tabular}{rrrrr}
## \hline
## mpg & cyl & disp & hp & drat \\
## \hline
## 21 & 6 & 160 & 110 & 3.9 \\
## 21 & 6 & 160 & 110 & 3.9 \\
## 22.8 & 4 & 108 & 93 & 3.85 \\
## 21.4 & 6 & 258 & 110 & 3.08 \\
## 18.7 & 8 & 360 & 175 & 3.15 \\
## 18.1 & 6 & 225 & 105 & 2.76 \\
## 14.3 & 8 & 360 & 245 & 3.21 \\
## 24.4 & 4 & 146.7 & 62 & 3.69 \\
## 22.8 & 4 & 140.8 & 95 & 3.92 \\
## 19.2 & 6 & 167.6 & 123 & 3.92 \\
## \hline
## \end{tabular}
## \end{center}
## \end{table}
```

# Headers

By default, xTab will use the column names for the head of the table(as
demonstrated in the above examples). To customize the table head simply pass in
the appropriate latex to the 'head' argument. The values of toprule and midrule
are still used and should not be set in the head argument. If you do not want
them included in your custom header, set either or both to NULL


```r
xTab(cars,
     head = 'col1 & col 2 & col3 & \\eta & col5 \\\\')
## \begin{table}[ht]
## \begin{center}
## \begin{tabular}{rrrrr}
## \hline
## col1 & col 2 & col3 & \eta & col5 \\
## \hline
## 21 & 6 & 160 & 110 & 3.9 \\
## 21 & 6 & 160 & 110 & 3.9 \\
## 22.8 & 4 & 108 & 93 & 3.85 \\
## 21.4 & 6 & 258 & 110 & 3.08 \\
## 18.7 & 8 & 360 & 175 & 3.15 \\
## 18.1 & 6 & 225 & 105 & 2.76 \\
## 14.3 & 8 & 360 & 245 & 3.21 \\
## 24.4 & 4 & 146.7 & 62 & 3.69 \\
## 22.8 & 4 & 140.8 & 95 & 3.92 \\
## 19.2 & 6 & 167.6 & 123 & 3.92 \\
## \hline
## \end{tabular}
## \end{center}
## \end{table}
```

Pass in NULL to avoid a table head. In the case of a NULL head, toprule and
midrule will not be used.


```r
xTab(cars, head = NULL)
## \begin{table}[ht]
## \begin{center}
## \begin{tabular}{rrrrr}
## 21 & 6 & 160 & 110 & 3.9 \\
## 21 & 6 & 160 & 110 & 3.9 \\
## 22.8 & 4 & 108 & 93 & 3.85 \\
## 21.4 & 6 & 258 & 110 & 3.08 \\
## 18.7 & 8 & 360 & 175 & 3.15 \\
## 18.1 & 6 & 225 & 105 & 2.76 \\
## 14.3 & 8 & 360 & 245 & 3.21 \\
## 24.4 & 4 & 146.7 & 62 & 3.69 \\
## 22.8 & 4 & 140.8 & 95 & 3.92 \\
## 19.2 & 6 & 167.6 & 123 & 3.92 \\
## \hline
## \end{tabular}
## \end{center}
## \end{table}
```

To preserve the top and midrules, pass an empty string to head. Often, people
want a toprule with no head or midrule. In that case, pass an empty string into
the head argument and NULL into midule. You can then use the default toprule
value (as depicted below), explicitly set toprule, or set booktabs = TRUE to set
the toprule and bottomrule simultaneously.


```r
lTab(cars, head = '', midrule = NULL)
## \begin{center}
## \begin{longtable}{rrrrr}
## \hline
## 
## 
## \endhead
## \hline
## \endfoot
## 21 & 6 & 160 & 110 & 3.9 \\
## 21 & 6 & 160 & 110 & 3.9 \\
## 22.8 & 4 & 108 & 93 & 3.85 \\
## 21.4 & 6 & 258 & 110 & 3.08 \\
## 18.7 & 8 & 360 & 175 & 3.15 \\
## 18.1 & 6 & 225 & 105 & 2.76 \\
## 14.3 & 8 & 360 & 245 & 3.21 \\
## 24.4 & 4 & 146.7 & 62 & 3.69 \\
## 22.8 & 4 & 140.8 & 95 & 3.92 \\
## 19.2 & 6 & 167.6 & 123 & 3.92 \\
## \end{longtable}
## \end{center}
```

# Rows

## Rownames

When including row names in a table, by default xTab will use an empty column
name for the 'rownames' column. When rows is not set, xTab looks for the value
of kLat.xTab.rows, then klat.rows, then defaults to false.


```r
xTab(cars, rows = TRUE)
## \begin{table}[ht]
## \begin{center}
## \begin{tabular}{rrrrr}
## \hline
##  & mpg & cyl & disp & hp & drat \\
## \hline
## Mazda RX4 & 21.0 & 6 & 160.0 & 110 & 3.90 \\
## Mazda RX4 Wag & 21.0 & 6 & 160.0 & 110 & 3.90 \\
## Datsun 710 & 22.8 & 4 & 108.0 &  93 & 3.85 \\
## Hornet 4 Drive & 21.4 & 6 & 258.0 & 110 & 3.08 \\
## Hornet Sportabout & 18.7 & 8 & 360.0 & 175 & 3.15 \\
## Valiant & 18.1 & 6 & 225.0 & 105 & 2.76 \\
## Duster 360 & 14.3 & 8 & 360.0 & 245 & 3.21 \\
## Merc 240D & 24.4 & 4 & 146.7 &  62 & 3.69 \\
## Merc 230 & 22.8 & 4 & 140.8 &  95 & 3.92 \\
## Merc 280 & 19.2 & 6 & 167.6 & 123 & 3.92 \\
## \hline
## \end{tabular}
## \end{center}
## \end{table}
```

## Rownames with custom header

When providing a custom head with rows set to TRUE, remember to account for the
extra column produced by the row names


```r
xTab(cars,
     rows =  TRUE,
     head = 'rows & col1 & col2 & col3 & \\eta & col5 \\\\')
## \begin{table}[ht]
## \begin{center}
## \begin{tabular}{rrrrr}
## \hline
## rows & col1 & col2 & col3 & \eta & col5 \\
## \hline
## Mazda RX4 & 21.0 & 6 & 160.0 & 110 & 3.90 \\
## Mazda RX4 Wag & 21.0 & 6 & 160.0 & 110 & 3.90 \\
## Datsun 710 & 22.8 & 4 & 108.0 &  93 & 3.85 \\
## Hornet 4 Drive & 21.4 & 6 & 258.0 & 110 & 3.08 \\
## Hornet Sportabout & 18.7 & 8 & 360.0 & 175 & 3.15 \\
## Valiant & 18.1 & 6 & 225.0 & 105 & 2.76 \\
## Duster 360 & 14.3 & 8 & 360.0 & 245 & 3.21 \\
## Merc 240D & 24.4 & 4 & 146.7 &  62 & 3.69 \\
## Merc 230 & 22.8 & 4 & 140.8 &  95 & 3.92 \\
## Merc 280 & 19.2 & 6 & 167.6 & 123 & 3.92 \\
## \hline
## \end{tabular}
## \end{center}
## \end{table}
```

## Row separator

Any arbitrary latex command can be inserted between each row, but the most
common are \\hline and \\midrule. To use \\midrule, \\usepackage{booktabs} must
be declared in the preamble of the latex document, but booktabs = TRUE **does
not** need to be set on the table. When rowsep is not set, xTab looks for the
value of kLat.xTab.rowsep, then kLat.rowsep, then defaults to an empty string.


```r
xTab(cars, rowsep = '\\hline')
## \begin{table}[ht]
## \begin{center}
## \begin{tabular}{rrrrr}
## \hline
## mpg & cyl & disp & hp & drat \\
## \hline
## 21 & 6 & 160 & 110 & 3.9 \\\hline
## 21 & 6 & 160 & 110 & 3.9 \\\hline
## 22.8 & 4 & 108 & 93 & 3.85 \\\hline
## 21.4 & 6 & 258 & 110 & 3.08 \\\hline
## 18.7 & 8 & 360 & 175 & 3.15 \\\hline
## 18.1 & 6 & 225 & 105 & 2.76 \\\hline
## 14.3 & 8 & 360 & 245 & 3.21 \\\hline
## 24.4 & 4 & 146.7 & 62 & 3.69 \\\hline
## 22.8 & 4 & 140.8 & 95 & 3.92 \\\hline
## 19.2 & 6 & 167.6 & 123 & 3.92 \\
## \hline
## \end{tabular}
## \end{center}
## \end{table}
```


```r
xTab(cars, rowsep = '\\midrule')
## \begin{table}[ht]
## \begin{center}
## \begin{tabular}{rrrrr}
## \hline
## mpg & cyl & disp & hp & drat \\
## \hline
## 21 & 6 & 160 & 110 & 3.9 \\\midrule
## 21 & 6 & 160 & 110 & 3.9 \\\midrule
## 22.8 & 4 & 108 & 93 & 3.85 \\\midrule
## 21.4 & 6 & 258 & 110 & 3.08 \\\midrule
## 18.7 & 8 & 360 & 175 & 3.15 \\\midrule
## 18.1 & 6 & 225 & 105 & 2.76 \\\midrule
## 14.3 & 8 & 360 & 245 & 3.21 \\\midrule
## 24.4 & 4 & 146.7 & 62 & 3.69 \\\midrule
## 22.8 & 4 & 140.8 & 95 & 3.92 \\\midrule
## 19.2 & 6 & 167.6 & 123 & 3.92 \\
## \hline
## \end{tabular}
## \end{center}
## \end{table}
```

# Columns

## Column alginment

Explicilty set the column definitions. If this is set, colsep will have no effect
and you must handle column separation within this declaration. Defaults to 'r' for
numeric vector columns and 'l' for character vector columns.


```r
xTab(cars, coldef ='rlc|l|p{5cm}')
## \begin{table}[ht]
## \begin{center}
## \begin{tabular}{rlc|l|p{5cm}}
## \hline
## mpg & cyl & disp & hp & drat \\
## \hline
## 21 & 6 & 160 & 110 & 3.9 \\
## 21 & 6 & 160 & 110 & 3.9 \\
## 22.8 & 4 & 108 & 93 & 3.85 \\
## 21.4 & 6 & 258 & 110 & 3.08 \\
## 18.7 & 8 & 360 & 175 & 3.15 \\
## 18.1 & 6 & 225 & 105 & 2.76 \\
## 14.3 & 8 & 360 & 245 & 3.21 \\
## 24.4 & 4 & 146.7 & 62 & 3.69 \\
## 22.8 & 4 & 140.8 & 95 & 3.92 \\
## 19.2 & 6 & 167.6 & 123 & 3.92 \\
## \hline
## \end{tabular}
## \end{center}
## \end{table}
```

## Column separator

Place any arbitrary latex between each column. Will have no effect if coldef is
set.


```r
xTab(cars, colsep = '|')
## \begin{table}[ht]
## \begin{center}
## \begin{tabular}{r|r|r|r|r}
## \hline
## mpg & cyl & disp & hp & drat \\
## \hline
## 21 & 6 & 160 & 110 & 3.9 \\
## 21 & 6 & 160 & 110 & 3.9 \\
## 22.8 & 4 & 108 & 93 & 3.85 \\
## 21.4 & 6 & 258 & 110 & 3.08 \\
## 18.7 & 8 & 360 & 175 & 3.15 \\
## 18.1 & 6 & 225 & 105 & 2.76 \\
## 14.3 & 8 & 360 & 245 & 3.21 \\
## 24.4 & 4 & 146.7 & 62 & 3.69 \\
## 22.8 & 4 & 140.8 & 95 & 3.92 \\
## 19.2 & 6 & 167.6 & 123 & 3.92 \\
## \hline
## \end{tabular}
## \end{center}
## \end{table}
```
