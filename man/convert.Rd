\name{convert}
\alias{convert}
\title{Convert from one file format to another}
\usage{convert(in_file, out_file, in_opts = list(), out_opts = list())}
\arguments{
    \item{in_file}{a character string naming an input file.}
    \item{out_file}{a character string naming an output file.}
    \item{in_opts}{a named list of options to be passed to \code{\link{import}}}
    \item{out_opts}{a named list of options to be passed to \code{\link{export}}}
}
\value{The name of the output file (invisibly).}
\description{This function constructs a data frame from a data file using code{\link{import}} and uses \code{\link{export}} to write the data to disk in the format indicated by the file extension.}
\examples{
# create a file to convert
export(iris, "iris.dta")

# convert Stata to CSV and open converted file
convert("iris.dta", "iris.csv")
head(import("iris.csv"))

# correct an erroneous file format
export(iris, "iris.csv", format = "tsv")
convert("iris.csv", "iris.csv", in_opts = list(format = "tsv"))

# convert serialized R data.frame to JSON
export(iris, "iris.rds")
convert("iris.rds", "iris.json")

# cleanup
unlink("iris.csv")
unlink("iris.dta")
unlink("iris.rds")
unlink("iris.json")

\dontrun{
# convert from the command line:
Rscript -e "rio::convert('iris.dta', 'iris.csv')"
}
}
\seealso{
\href{https://lbraglia.github.io/}{Luca Braglia} has created a Shiny app called \href{https://github.com/lbraglia/rioweb}{rioweb} that provides access to the file conversion features of rio through a web browser. The app is featured in the \href{https://gallery.shinyapps.io/rioweb}{RStudio Shiny Gallery}.
}
