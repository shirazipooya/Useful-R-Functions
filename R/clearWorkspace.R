#' Clear the Workspace (Based on mise Package)
#' 
#' @param vars    clear all variables and functions in the parent environment? Defaults to TRUE.
#' @param figs    close all figure windows? Defaults to TRUE.
#' @param pkgs    clear all non-base packages?  Defaults to TRUE.
#' @param console clear the console? Defaults to TRUE.
#' @export
#' @examples
#' source("https://raw.githubusercontent.com/shirazipooya/Useful-R-Functions/master/R/clearWorkspace.R)
#' x <- 1:10
#' y <- x + rnorm(n = 10, mean = 0, sd = 1)
#' plot(x, y)
#' AddFunc <- function(x,y) {x + y}
#' ls()
#' clearWorkspace()

clearWorkspace <- function(vars = TRUE, figs = TRUE, console = TRUE, pkgs = TRUE)
{
    # Delete All Variables And Functions From Memory: -------------------------------------------------------
    if (vars) 
    {
        where <- parent.frame()
        rm(list = ls(envir = where), envir = where)
    }

    # Close All Open Plots: ---------------------------------------------------------------------------------
    if (figs && !is.null(grDevices::dev.list())) 
    {
        grDevices::graphics.off()
    }

    # Unload Packages: --------------------------------------------------------------------------------------
    if (pkgs) 
    {
        extra.pkgs <- paste("package:", names(utils::sessionInfo()$otherPkgs), sep = "")
        if (extra.pkgs[1] != "package:")
        {
            lapply(extra.pkgs, detach, character.only = TRUE, unload = TRUE, force = TRUE)
        }
    }

    # Clear The Console: ------------------------------------------------------------------------------------
    if (console)
    {
        if (Sys.getenv("RSTUDIO") == 1)
        {
            cat("\014")       # Works In RStudio.
        } else {
            cat(rep("\n",50)) # Works In Environments Other Than RStudio.
        }
    }
}
