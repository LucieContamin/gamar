\name{setparametervalue}
\alias{setparametervalue}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Defined a parameter value and send it to gama
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
Once you have loaded your model with \code{getmodelparameter}, you can access one by one to your parameter declared in the Gama \code{experiment} with \code{setparametervalue}.
}
\usage{
setparametervalue(dictionary, name, value)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dictionary}{
%%     ~~Describe \code{dictionary} here~~
is a list created from \code{getmodelparameter} containing all information (in XML) to run your model.
}
  \item{name}{
%%     ~~Describe \code{name} here~~
is the name of parameter setting (defined in the Gama experiment) you want to change.
}
  \item{value}{
%%     ~~Describe \code{value} here~~
the value you want to send in Gama. Type is important, you can send an integer, float, string, etc.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
Documentation : Etienne Delay (UMI 3198 CNRS - ESS et UMR 6042 CNRS - Geolab)
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
\code{\link{getmodelparameter}}
}
\examples{
  library(gamar)
  defpath("~/app/Gama1.7.2RC/") ## path to gama app. directory
  experiment1 <- getmodelparameter(paste0(f,"/sir.gaml"),"sir") ##Like the Gama model (from example) in R
  experiment1 <- setparametervalue(experiment1,"I0",10)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
