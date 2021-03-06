% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/find_beta.R
\name{find_beta}
\alias{find_beta}
\title{Fits beta from one resolution to another (Raster)}
\usage{
find_beta(fit_data, rasterl, interval = 100, num_runs = 500)
}
\arguments{
\item{fit_data}{The incidence data to use for fitting.}

\item{rasterl}{The Rasterlayer to fit on.}

\item{interval}{The interval on which the fit should be performed, in days (default is 100 - i.e. the fit will
be performed on the first 100 days of the epidemic).}

\item{num_runs}{Number of stochastic runs to extract the median incidence for one beta value (default is 500).
Higher values will be longer to run, but yield more accurate results.}
}
\value{
Returns the fitted value of beta.
}
\description{
Adjusts beta to fit the incidence of one resolution onto another.
}
\examples{

#Create a high resolution RasterLayer object:
htest_data = raster(nrow=20, ncol=20, xmn=1, xmx=100000, ymn=1, ymx=100000)
values(htest_data) = runif(400, 1, 1000)

#Calculate the median incidence for the high resolution data:
prep_simulation(htest_data)
results_high = multi_stoch(500, htest_data, expanded_D, contact_mat, beta, t_max=100)
results_high = results_high$Median


#Create a low resolution RasterLayer object:
ltest_data = raster(nrow=10, ncol=10, xmn=1, xmx=100000, ymn=1, ymx=100000)
values(ltest_data) = runif(100, 1, 1000)

#Fit low resolution on high resolution:
fitted_beta = find_beta(results_high, test, interval=100)

}
