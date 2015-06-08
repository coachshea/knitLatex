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
#' @param cap.fhead,cap.head,cap.foot,cap.lfoot paces the caption in the
#'   firsthead, head, foot, or lastfoot respectively. It is important not to set a
#'   caption in an otherwise NULL section or strange bugs can occur. It is
#'   accaptable if the setting was set by default as in head and foot. Consult the
#'   longtable documentation for a more detailed explanation of these options.
#'
#' @inheritParams xTab
#'
#' @examples
#' lTab(mtcars)
lTab <- function(x, label = NULL,
                 cap.fhead = NULL,
                 cap.head = NULL,
                 cap.foot = NULL,
                 cap.lfoot = NULL,
                 booktabs = .op('kLat.lTab.booktabs', 'kLat.booktabs', FALSE),
                 toprule = .book('kLat.toprule', booktabs, '\\toprule', '\\hline'),
                 botrule = .book('kLat.botrule', booktabs, '\\bottomrule', '\\hline'),
                 midrule = .book('kLat.midrule', booktabs, '\\midrule', '\\hline'),
                 rowsep = .op('kLat.lTab.rowsep', 'kLat.rowsep', ''),
                 rows = .op('kLat.lTab.rows', 'kLat.rows', FASLE),
                 colsep = .op('kLat.lTab.colsep', 'kLat.colsep', ''),
                 coldef = .coldef(x, colsep),
                 align = .op('kLat.lTab.align', 'kLat.align', 'center'),
                 header = .header(x, rows),
                 envir = getOption('kLat.lTab.envir', 'longtable'),
                 fsthead = NULL,
                 foot = botrule,
                 lastfoot = NULL){
  .pt(c(
       .printif(align, "\\begin{%s}"),
       sprintf('\\begin{%s}{%s}', envir, coldef),
       .printif(cap.fhead, "\\caption{%s}"),
       .printif(fsthead, "%s\n\\endfirsthead"),
       .printif(cap.head, "\\caption{%s}"),
       .printif(.printhead(toprule, header, midrule), "%s\n\\endhead"),
       .printif(cap.foot, "\\caption{%s}"),
       .printif(foot, "%s\n\\endfoot"),
       .printif(cap.lfoot, "\\caption{%s}"),
       .printif(lastfoot, "%s\n\\endlastfoot"),
       .body(x, rows, rowsep),
       .printif(label, "\\label{%s}"),
       sprintf('\\end{%s}', envir),
       .printif(align, '\\end{%s}')
       ))
}
