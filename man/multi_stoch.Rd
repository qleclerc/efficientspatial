% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/multi_stoch.R
\name{multi_stoch}
\alias{multi_stoch}
\title{Runs multiple stochastic simulations (Raster)}
\usage{
multi_stoch(num_runs = 100, rasterl, D, contact_mat, beta, sigma = 1/2.6,
  step = 1, start_area = 1, start_num = 10, t_max = 200)
}
\arguments{
\item{num_runs}{The number of stochastic runs to perform.}

\item{rasterl}{The RasterLayer object containing the population data.}

\item{D}{The expanded kernel matrix to use for FOI calculation (generated by the \code{\link{calc_beta}}
function).}

\item{contact_mat}{The contact matrix for mixing between age groups.}

\item{beta}{The beta value for the epidemic (calculated from a given R0 using the \code{\link{calc_beta}}
function).}

\item{sigma}{The recovery rate for the epidemic (must match the one used to calculate beta from R0
using the \code{\link{calc_beta}} function).}

\item{step}{Size of time step for stochastic simulation, in days (default is 1 day).}

\item{start_area}{Where to start the epidemic. 1: Most highly populated area (default), 2: A
random area in the middle of the country (typically medium population density), 3: A
random area in the north of the country (typically low population density). NOTE: CURRENTLY
ONLY SUPPORTS OPTION 1}

\item{start_num}{Number of infected individuals to start the epidemic.}

\item{t_max}{How many days to run the simulation for.}
}
\value{
Returns one dataframe object containing the median and 95% range of all of the simulation results.
}
\description{
Simulates multiple stochastic epidemics using the provided Rasterlayer, spatial kernel, contact
             matrix, and infection parameters.
}
\details{
This functions requires specific objects to run. These can be generated using the \code{\link{prep_simulation}}
         function (e.g. if you want to simulate an epidemic using the RasterLayer object "toy_data", you must
         prep_simulation(toy_data) first). The model used is an SIR model, where individuals can be either
         Susceptible, Infected or Recovered with regards to the disease. This assumes that Infected individuals
         are infectious, and that Recovered individuals are immune and cannot be reinfected.
}
\examples{

#Create a RasterLayer object:
test_data = raster(nrow=10, ncol=10, xmn=1, xmx=100000, ymn=1, ymx=100000)
values(test_data) = runif(100, 1, 1000)

#Calculate the parameters for the simulation:
prep_simulation(test_data)

results = multi_stoch(100, test_data, expanded_D, contact_mat, beta = beta)
View(results)


}
