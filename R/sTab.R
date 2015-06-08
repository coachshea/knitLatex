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
                 booktabs = getOption('kLat.sTab.booktabs', getOption('kLat.booktabs', FALSE)),
                 toprule = .book('kLat.toprule', booktabs, '\\toprule', '\\hline'),
                 botrule = .book('kLat.botrule', booktabs, '\\bottomrule', '\\hline'),
                 midrule = .book('kLat.midrule', booktabs, '\\midrule', '\\hline'),
                 colsep = getOption('kLat.sTab.colsep', getOption('kLat.colsep', '')),
                 align = .align(x, colsep),
                 rowsep = getOption('kLat.sTab.rowsep', getOption('kLat.rowsep', '')),
                 rows = getOption('kLat.sTab.rows', getOption('kLat.rows', FALSE)),
                 float = getOption('kLat.sTab.float', getOption('kLat.float', 'center')),
                 envir = getOption('kLat.sTab.envir', 'supertabular'),
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
