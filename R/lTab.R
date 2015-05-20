#' @export
lTab <- function(x, label = NULL, caption = NULL,
                 booktabs = getOption('knitrLatex.booktabs', FALSE),
                 toprule = .book('knitrLatex.toprule', booktabs, '\\toprule', '\\hline'),
                 bottomrule = .book('knitrLatex.bottomrule', booktabs, '\\bottomrule', '\\hline'),
                 midrule = .book('knitrLatex.midrule', booktabs, '\\midrule', '\\hline'),
                 align = .getAlign(x),
                 head = .head(x, toprule, midrule),
                 firsthead = NULL,
                 foot = bottomrule,
                 lastfoot = NULL){
  .pt(c(
       '\\begin{center}',
       paste0('\\begin{longtable}', .align(align)),
       .printif(caption, "\\caption{%s}"),
       .printif(firsthead, "%s\n\\endfirsthead"),
       .printif(head, "%s\n\\endhead"),
       .printif(foot, "%s\n\\endfoot"),
       .printif(lastfoot, "%s\n\\endlastfoot"),
       .body(x),
       .printif(label, "\\label{%s}"),
       '\\end{longtable}',
       '\\end{center}'
       ))
}
