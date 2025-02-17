# |  (C) 2008-2023 Potsdam Institute for Climate Impact Research (PIK)
# |  authors, and contributors see CITATION.cff file. This file is part
# |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
# |  AGPL-3.0, you are granted additional permissions described in the
# |  MAgPIE License Exception, version 1.0 (see LICENSE file).
# |  Contact: magpie@pik-potsdam.de

# --------------------------------------------------------
# description: calculate and store new land conversion cost calibration factors for default setup (time consuming; up to 40 model runs with 1 or 5 time steps)
# --------------------------------------------------------

library(magpie4)
library(magclass)

# Load start_run(cfg) function which is needed to start MAgPIE runs
source("scripts/start_functions.R")

#start MAgPIE run
source("config/default.cfg")
cfg$results_folder <- "output/:title:"

cfg$recalibrate_landconversion_cost <- TRUE
cfg$best_calib_landconversion_cost <- FALSE

cfg$recalibrate <- "ifneeded"
cfg$gms$c_timesteps <- 5
cfg$sequential <- TRUE
cfg$title <- "calib_run"
cfg$output <- c("rds_report","validation_short")
cfg$force_replace <- TRUE
start_run(cfg,codeCheck=FALSE)
magpie4::submitCalibration("H12")
