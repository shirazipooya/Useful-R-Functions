
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
