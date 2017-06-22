\name{getmodelparameter}
\alias{getmodelparameter}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Parameter loader for GAMA
}
\description{
Load and read parameter and outputs from your model
}
\usage{
getmodelparameter(modelfile, experimentname)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{modelfile}{
Path of your gaml file
}
  \item{experimentname}{
Experiment name inside your model
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
good luck
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...

Experiment name is defined in the model and can not be null
Model file must exist :-)
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
When you have define your plateform location with \code{\link{defpath}}, you can load experiment with the following command :

> experiment1 <- getmodelparameter(paste0(f,"/sir.gaml"),"sir")
Loading experiment 'sir' from file 'sir.gaml'...


## The function is currently defined as
function (modelfile, experimentname)
{
    cat(paste0("Loading experiment '", experimentname, "' from file '",
        basename(modelfile), "'...\n"))
    outfile <- createmodelparameterfilename(experimentname)
    trycommand <- system(paste0("java -jar ", getOption("gamar.startjar"),
        " -Xms", getOption("gamar.Xms"), " -Xmx", getOption("gamar.Xmx"),
        " -Djava.awt.headless=true org.eclipse.core.launcher.Main ",
        "-application msi.gama.headless.id4 -xml ", experimentname,
        " ", modelfile, " ", outfile, ">/dev/null"), ignore.stdout = T,
        ignore.stderr = T)
    unlink("workspace", T, T)
    if (trycommand > 0)
        return(-1)
    out <- XML::xmlToList(XML::xmlParse(outfile))
    class(out) <- c("experiment", class(out))
    out
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
