#' Produces a latex supertabular environment
#'
#' @param fsthead header on first page of table only
#'
#' @param head header to appear at the top of every page of table
#'
#' @param tail footer on bottom of every page of table
#'
#' @param lasttail footer on last page of table only
#'
#' @param cap.table sets '\\tablecaption' option of supertabular, which allows
#'   for a default placement of the caption, see
#'   supertabular documentation for a more detailed explanation.
#'
#' @inheritParams xTab
#'
#' @examples
#' sTab(mtcars)
#' sTab(mtcars,
#'   cap.top = 'my super table',
#'   booktabs = TRUE,
#'   rows = TRUE)
sTab <- function(x, label = NULL,
                 cap.top = NULL,
                 cap.bot = NULL,
                 cap.table = NULL,
                 booktabs = getOption('kLat.sTab.booktabs', getOption('kLat.booktabs', FALSE)),
                 toprule = .book('kLat.toprule', booktabs, '\\toprule', '\\hline'),
                 botrule = .book('kLat.botrule', booktabs, '\\bottomrule', '\\hline'),
                 midrule = .book('kLat.midrule', booktabs, '\\midrule', '\\hline'),
                 colsep = getOption('kLat.sTab.colsep', getOption('kLat.colsep', '')),
                 coldef = .coldef(x, colsep),
                 rowsep = getOption('kLat.sTab.rowsep', getOption('kLat.rowsep', '')),
                 rows = getOption('kLat.sTab.rows', getOption('kLat.rows', FALSE)),
                 align = getOption('kLat.sTab.align', getOption('kLat.align', 'center')),
                 envir = getOption('kLat.sTab.envir', 'supertabular'),
                 header = .header(x, rows),
                 fsthead = NULL,
                 tabletail = botrule,
                 lasttail = NULL){
  .pt(c(
       .printif(fsthead, "\\tablefirsthead{%s}"),
       .printif(.printhead(toprule, header, midrule), "\\tablehead{%s}"),
       .printif(tabletail, "\\tabletail{%s}"),
       .printif(lasttail, "\\tablelasttail{%s}"),
       .printif(cap.top, "\\topcaption{%s}"),
       .printif(cap.bot, "\\bottomcaption{%s}"),
       .printif(cap.table, "\\bottomcaption{%s}"),
       .printif(align, "\\begin{%s}"),
       sprintf("\\begin{%s}{%s}", envir, coldef),
       .printif(label, "\\label{%s}"),
       .body(x, rows, rowsep),
       sprintf("\\end{%s}", envir),
       .printif(align, "\\end{%s}")
       ))
}
