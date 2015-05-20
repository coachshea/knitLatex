#' @export
xTab <- function(x, label = NULL,
                 caption.top = NULL,
                 caption.bottom = NULL,
                 options = getOption('knitrLatex.options', 'ht'),
                 booktabs = getOption('knitrLatex.booktabs', FALSE),
                 toprule = .book('knitrLatex.toprule', booktabs, '\\toprule', '\\hline'),
                 bottomrule = .book('knitrLatex.bottomrule', booktabs, '\\bottomrule', '\\hline'),
                 midrule = .book('knitrLatex.midrule', booktabs, '\\midrule', '\\hline'),
                 align = .getAlign(x),
                 head = .head(x, toprule, midrule),
                 foot = bottomrule){
  .pt(c(
       paste0('\\begin{table}', .printif(options, "[%s]")),
       '\\centering',
       .printif(caption.top, "\\caption{%s}"),
       paste0('\\begin{tabular}', .align(align)),
       .printif(head, "%s"),
       .body(x),
       .printif(foot, "%s"),
       '\\end{tabular}',
       .printif(caption.bottom, "\\caption{%s}"),
       .printif(label, "\\label{%s}"),
       '\\end{table}'
       ))
}
