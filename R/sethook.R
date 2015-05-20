#' @export
knitr_sethooks <- function(){

  hook_chunk = knitr::knit_hooks$get('chunk')

  knitr::knit_hooks$set(chunk = function(x, options){
                        x = hook_chunk(x, options)
                        if (options$results == 'asis'){
                          # remove all kframe's
                          gsub('\\\\(begin|end)\\{kframe\\}', '', x)
                        } else x
  })

  knitr::knit_hooks$set(com = function(before, options, envir){
                        if (before){
                          sprintf("\\newcommand\\%s{%%\n", options$label)
                        } else "}"
  })
}
