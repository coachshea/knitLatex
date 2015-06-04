#' Produces a latex supertabular environment
#'
#' @param fsthead header on first page of table only
#' @param head header to appear at the top of every page of table
#' @param tail footer on bottom of every page of table
#' @param lasttail footer on last page of table only
#' @inheritParams xTab
#' @examples
#' sTab(mtcars)
#' sTab(mtcars,
#'   cap.top = 'my super table',
#'   booktabs = TRUE,
#'   rows = TRUE)
sTab <- function(x, label = NULL,
                 cap.top = NULL,
                 cap.bot = NULL,
                 booktabs = getOption('knitLat.booktabs', FALSE),
                 toprule = .book('knitLat.toprule', booktabs, '\\toprule', '\\hline'),
                 botrule = .book('knitLat.botrule', booktabs, '\\bottomrule', '\\hline'),
                 midrule = .book('knitLat.midrule', booktabs, '\\midrule', '\\hline'),
                 colsep = '',
                 align = .align(x, colsep),
                 rowsep = '',
                 rows = getOption('knitLat.rows', FALSE),
                 float = 'center',
                 envir = 'supertabular',
                 header = .header(x, rows),
                 fsthead = NULL,
                 tabletail = botrule,
                 lasttail = NULL){
  .pt(c(
       .printif(float, "\\begin{%s}", float),
       .printif(fsthead, "\\tablefirsthead{%s}"),
       .printif(.printhead(toprule, header, midrule), "\\tablehead{%s}"),
       .printif(tabletail, "\\tabletail{%s}"),
       .printif(lasttail, "\\tablelasttail{%s}"),
       .printif(cap.top, "\\topcaption{%s}"),
       .printif(cap.bot, "\\bottomcaption{%s}"),
       sprintf("\\begin{%s}{%s}", envir, align),
       .printif(label, "\\label{%s}"),
       .body(x, rows, rowsep),
       sprintf("\\end{%s}", envir),
       .printif(float, "\\end{%s}", float)
       ))
}
