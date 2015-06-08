#' Produces a latex table
#' 
#' 
#' @param x a data.frame or matrix to form the base of the table
#'
#' @param cap.top sets the caption command placing it at the top
#'   of the table
#'
#' @param cap.bot sets the caption command placing it at the
#'   bottom of the table
#'
#' @param position sets the position of the table i.e.
#'   \\begin\{table\}['position']

#' @param booktabs logical value, if not set will use value of
#'   kLat.(xTab|sTab|lTab).booktabs, if not set will use value of kLat.booktabs,
#'   if not set defaults to false. When TRUE toprule defaults to '\\toprule',
#'   midrule to '\\midrule', and botrule to '\\bottomrule', when FALSE those
#'   values all default to '\\hline'. Has no effect when toprule, midrule, and
#'   botrule are individually set.
#'
#' @param toprule sets the value for the top rule, if not set will be
#'   determined by the value of booktabs
#'
#' @param botrule sets the value for the bottom rule, if not set will
#'   be determined by the value of booktabs
#'
#' @param midrule sets the value for the mid rule, if not set will
#'   be determined by the value of booktabs
#'
#' @param colsep separaotr to be used between columns (i.e. '|'), defaults to
#'   '', if coldef is set this value is ignored and the separators must be
#'   specificed in the coldef
#'
#' @param coldef sets column definition i.e. \\begin\{tabular\}\{'align'\},
#'   if not set defaults to numeric = right, character = left 
#'
#' @param rows include rownames in table, by default the column names
#'   will be an empty string
#'
#' @param rowsep the separaotr to be used between rows (i.e. '\\hline'),
#'   defaults to ''
#'
#' @param header sets the value for the table header, defaults to the column
#'   names; if you set this be sure to end with '\\\\\\\\'
#'
#' @param foot sets value of the table footer, defaults to the value of
#'   bottomrule
#'
#' @examples
#' xTab(mtcats)
#' xTab(mtcats, label='my table', caption.top='tab:mytable', booktabs=TRUE)
#' xTab(mtcats, head='col1 & col2 & \\eta\\\\')
xTab <- function(x, label = NULL,
                 cap.top = NULL,
                 cap.bot = NULL,
                 position = getOption('knitLat.xTab.position', 'ht'),
                 booktabs = .op('kLat.xTab.booktabs', 'kLat.booktabs', FALSE),
                 toprule = .book('knitLat.toprule', booktabs, '\\toprule', '\\hline'),
                 botrule = .book('knitLat.botrule', booktabs, '\\bottomrule', '\\hline'),
                 midrule = .book('knitLat.midrule', booktabs, '\\midrule', '\\hline'),
                 align = .op('kLat.xTab.align', 'kLat.align', 'center'),
                 envir = getOption('knitLat.xTab.envir', 'tabular'),
                 colsep = .op('kLat.xTab.colsep', 'kLat.colsep', ''),
                 coldef = .coldef(x, colsep),
                 rowsep = .op('kLat.xTab.rowsep', 'kLat.rowsep', ''),
                 rows = .op('kLat.xTab.rows', 'kLat.rows', FASLE),
                 header = .header(x, rows),
                 foot = botrule){
  .pt(c(
       paste0('\\begin{table}', .printif(position, "[%s]")),
       .printif(align, '\\begin{%s}'),
       .printif(cap.top, "\\caption{%s}"),
       sprintf('\\begin{%s}{%s}', envir, coldef),
       .printif(header, .printhead(toprule, header, midrule)),
       .body(x, rows, rowsep),
       .printif(foot, "%s"),
       '\\end{tabular}',
       .printif(cap.bot, "\\caption{%s}"),
       .printif(label, "\\label{%s}"),
       .printif(align, '\\end{%s}'),
       '\\end{table}'
       ))
}
