#' @export
sTab <- function(x, label = NULL,
                 caption.top = NULL,
                 caption.bottom = NULL,
                 booktabs = getOption('knitrLatex.booktabs', FALSE),
                 toprule = .book('knitrLatex.toprule', booktabs, '\\toprule', '\\hline'),
                 bottomrule = .book('knitrLatex.bottomrule', booktabs, '\\bottomrule', '\\hline'),
                 midrule = .book('knitrLatex.midrule', booktabs, '\\midrule', '\\hline'),
                 align = .getAlign(x),
                 tablehead = .head(x, toprule, midrule),
                 tablefirsthead = NULL,
                 tabletail = bottomrule,
                 tablelasttail = NULL){
  .pt(c(
       '\\begin{center}',

       .printif(tablehead, "\\tablehead{%s}"),
       .printif(tabletail, "\\tabletail{%s}"),
       .printif(tablelasttail, "\\tablelasttail{%s}"),
       .printif(caption.top, "\\topcaption{%s}"),
       .printif(caption.bottom, "\\bottomcaption{%s}"),
       paste0('\\begin{supertabular}', .align(align)),
       .printif(label, "\\label{%s}"),
       .body(x),
       '\\end{supertabular}',
       '\\end{center}'
       ))
}
