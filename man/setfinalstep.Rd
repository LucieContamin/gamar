\name{setfinalstep}
\alias{setfinalstep}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Set an iteration limit for your model execution
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
You can define a maximum number of iterations from R.
}
\usage{
setfinalstep(dictionary, value)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dictionary}{
%%     ~~Describe \code{dictionary} here~~
is a list created from \code{getmodelparameter} containing all information (in XML) to run your model.
}
  \item{value}{
%%     ~~Describe \code{value} here~~
the value you want to send in Gama to define the final step of your experiment.
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
}
\examples{
## One your model is defined (from getmodelparameter()) you can use this function
experiment1 <- setfinalstep(experiment1,160)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
