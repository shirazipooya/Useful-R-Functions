#' Check, Install and Load CRAN Packages
#'
#' @param package1 R package.
#' @param ... Any additional R packages.
#'
#' @examples
#' installPackages("data.table", "dplyr")

# Function Start
installPackages <- function(package1, ...)
{
    # convert arguments to vector
    packages <- c(package1, ...)
    
    # start loop to determine if each package is installed
    for (package in packages)
    {
        # if package is installed locally, load
        if (package %in% rownames(x = installed.packages()))
        {
            do.call(what = library, args = list(package))
        } else {
            # if package is not installed locally, download and then load
            install.packages(pkgs = package, dependencies = TRUE)
            do.call(what = library, args = list(package))
        }
    }
}
# Function End
