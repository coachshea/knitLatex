# create table header
.head <- function(x, top, mid){
  z <- paste(paste(colnames(x), collapse=' & '), '\\\\')
  paste(top, z, mid, sep='\n')
}

# sprintf if
.printif <- function(x, str, ...){ if (!is.null(x)) sprintf(str, x, ...) }

# if booktabs else - helper function
.book <- function(opt, booktabs, true, false){
  getOption(opt, ifelse(booktabs, true, false))
}

# create table body
.body <- function(x){
  paste(apply(x, 1, paste, collapse=' & '), '\\\\')
}

# align columns
.getAlign <- function(x){
  paste(ifelse(sapply(x, is.numeric), 'r', 'l'), collapse='')
}

# add '{' and '}' to align
.align <- function (x) {
  paste0('{', x, '}')
}

# paste table
.pt <- function(x){
  cat(paste(x, collapse='\n'), '\n')
}
