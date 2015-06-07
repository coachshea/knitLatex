#' Produces a latex longtable
#'
#' @param fsthead header on first page of table only; defaults to header; if you
#'   set this, you are responsible for setting any \\hline, \\toprule, or \\midrule
#'   lines
#'
#' @param lastfoot footer on last page of table only
#'
#' @param caption the caption for the table, unlinke xTab and sTab, there is no
#'   caption.top or captio.bottom option in longtable
#'
#' @inheritParams xTab
#' @examples
#' lTab(mtcars)
lTab <- function(x, label = NULL, caption = NULL,
                 booktabs = getOption('knitLat.booktabs', FALSE),
                 toprule = .book('knitLat.toprule', booktabs, '\\toprule', '\\hline'),
                 botrule = .book('knitLat.botrule', booktabs, '\\bottomrule', '\\hline'),
                 midrule = .book('knitLat.midrule', booktabs, '\\midrule', '\\hline'),
                 colsep = '',
                 align = .align(x, colsep),
                 rowsep = '',
                 rows = getOption('knitLat.rows', FALSE),
                 position = getOption('knitLat.lTab.position', 'c'),
                 header = .header(x, rows),
                 float = getOption('knitLat.lTab.float', 'center')
                 envir = getOption('knitLat.lTab.envir', 'longtable'),
                 fsthead = NULL,
                 foot = botrule,
                 lastfoot = NULL){
  .pt(c(
       .printif(float, "\\begin{%s}", float),
       sprintf('\\begin{%s}[{%s}]{%s}', envir, pos, align),
       .printif(caption, "\\caption{%s}"),
       .printif(fsthead, "%s\n\\endfirsthead"),
       .printif(.printhead(toprule, header, midrule), "%s\n\\endhead"),
       .printif(foot, "%s\n\\endfoot"),
       .printif(lastfoot, "%s\n\\endlastfoot"),
       .body(x, rows, rowsep),
       .printif(label, "\\label{%s}"),
       sprintf('\\end{%s}', envir),
       .printif(float, '\\end{%s}', float)
       ))
}
