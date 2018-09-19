#' is.nan for Dataframe
#' 
#' @param x    A Dataframe.
#' @export
#' @examples
#' source("https://raw.githubusercontent.com/shirazipooya/Useful-R-Functions/master/R/isnanDataframe.R)
#' df <- data.frame(A = c(1, 2, NaN, 3, NA), B = c(11, 22, 33, 44, NaN))
#' df[isnanDataframe(df)] <- NA

isnanDataframe <- function(x)
{
    do.call(what = cbind, args = lapply(x = x, FUN = is.nan))
}
