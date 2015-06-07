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
#'
#' @param booktabs if set to true will use booktabs' \\toprule, \\midrule, and
#'   \\bottomrule, if not set will use value of knitLat.booktabs, if that is
#'   not set defaults to false 
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
#' @param align sets column alignment i.e. \\begin\{tabular\}\{'align'\},
#'   if not set defaults to numeric = right, character = left 
#'
#' @param rows include rownames in table, by default the column name
#'   wil be an empty string
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
                 booktabs = getOption('knitLat.booktabs', FALSE),
                 toprule = .book('knitLat.toprule', booktabs, '\\toprule', '\\hline'),
                 botrule = .book('knitLat.botrule', booktabs, '\\bottomrule', '\\hline'),
                 midrule = .book('knitLat.midrule', booktabs, '\\midrule', '\\hline'),
                 float = getOption('knitLat.xTab.float', 'center'),
                 envir = getOption('knitLat.xTab.envir', 'tabular'),
                 colsep = '',
                 rowsep = '',
                 align = .align(x, colsep),
                 rows = getOption('knitLat.rows', FALSE),
                 header = .header(x, rows),
                 foot = botrule){
  .pt(c(
       paste0('\\begin{table}', .printif(position, "[%s]")),
       .printif(float, '\\begin{%s}', float),
       .printif(cap.top, "\\caption{%s}"),
       sprintf('\\begin{%s}{%s}', envir, align),
       .printif(header, .printhead(toprule, header, midrule)),
       .body(x, rows, rowsep),
       .printif(foot, "%s"),
       '\\end{tabular}',
       .printif(cap.bot, "\\caption{%s}"),
       .printif(label, "\\label{%s}"),
       .printif(float, '\\end{%s}', float),
       '\\end{table}'
       ))
}
