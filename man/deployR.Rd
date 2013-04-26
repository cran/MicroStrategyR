\name{deployR}
\alias{deployR}
\title{deployR Function}
\usage{
  deployR()
}
\description{
  \code{deployR} is a utility that prepares an R Script for
  execution by MicroStrategy. It captures all the
  information required to properly execute the R Script
  into a comment block added to the beginning of the
  script.
}
\details{
  This function launches a user interface which allows the
  user to open an R Script and capture its
  \dQuote{signature}, the nature of inputs and outputs
  along with other information about how the R analytic
  should be executed.

  The deployR menu bar has the following functions:
  \itemize{ \item \strong{Open}: Browse to choose the R
  Script you want to deploy.  \item \strong{Preview}:
  Preview the header block to be added to the top of the
  script. You'll also be given the option to save as well.
  \item \strong{Save}: Saves the header block to the R
  Script \item \strong{Help}: Opens the on-line help \item
  \strong{About}: Provides details about the deployR
  utility, including the version \item \strong{Quit}: Exits
  the utility }

  To get started, click the \strong{Open} button at the
  upper left to open your R script.

  After you open your R script, the \code{deployR} utility
  parses the script to identify all potential variables.
  \itemize{ \item If this script contains the MicroStrategy
  header block at the top then that information will be
  used to configure the utility and any variables not
  identified will appear in the \strong{Unused Variables}
  column.  \item On the other hand, if there is no
  MicroStrategy header block, the deployR utility attempts
  to determine whether a variable is an \strong{Input} or
  an \strong{Output} based on the first occurrence of that
  variable in the script. If the variable's first
  occurrence assigns it a value, it is considered an
  output; otherwise, it is designated as an input.  \item
  For new variables, the default \strong{Data Type} is
  \emph{Numeric} and the default \strong{Parameter Type} is
  \emph{Vector}. } The \strong{Use R Script Folder}
  checkbox controls whether the path used to open the
  script will be used, or if the R Scripts folder will be
  used.

  Next, modify the definition each variable as required to
  match the function's logic, by draging-and-droping
  variables to place them in the appropriate columns:
  \itemize{ \item \strong{Unused Variables} are variables
  that appear in the R script but are not passed between
  MicroStraegy and R as either inputs, outputs or
  parameters.  The order of unused variables does not
  affect the R script execution.  \item \strong{Input}
  indicates data imported into R from MicroStrategy.  The
  order of inputs, from top to bottom, determines the order
  of arguments passed in from MicroStrategy, from left to
  right.  \item \strong{Parameter} allows data to be passed
  as one of the various function parameters available for
  passing scalar values from MicroStratregy to R.  These
  function parameters include booleans, numbers, and
  strings. Parameters are typically used for values that
  are changed infrequently or values that are not
  determined from other metrics. Use the Parameter
  drop-down list to specify which parameter to use. Each
  parameter can only be used for one variable.  The order
  of parameters does not affect the R script execution.
  \item \strong{Output} indicates data returned from R to
  MicroStrategy.  If there is more than one output, the
  first output is considered the default output.  Beyond
  that, the order of outputs does not affect the signature.
  }

  Set the \strong{Data Type} of each variable to one of the
  following options: \itemize{ \item \emph{Numeric}
  indicates variables that contain numbers.  \item
  \emph{String} indicates variables that contain text.
  \item \emph{Default} indicates that the data type defined
  by MicroStrategy should be used. This setting can be used
  for inputs only. }

  Set the \strong{Parameter Type} of each variable to one
  of the following options: \itemize{ \item \emph{Vector}
  indicates a variable that contains one or more values.
  \item \emph{Scalar} indicates a that variable contains
  only one value. }

  If one or more of the variables form a repeated argument,
  set the \strong{Repeat Count} to match the number of
  repeat arguments.  This option identifies an input that
  can vary in quantity; such variables are known as
  repeated arguments because they represent a varying
  number of variables. The Repeat Count value specifies how
  many of variables are repeated, counting back from the
  last variable. These variables always occur at the end of
  the list of arguments.  These variables will appear in
  the Inputs column with an asterisk (*).  Examples
  include: \itemize{ \item A predictive analytical function
  supports one target variable Y (the dependent variable)
  and an indeterminate number of explanatory variables X
  (independent variables). Establish this configuration by
  setting Y as the first variable, setting X as the second
  variable, and setting Repeat Count to 1. The deployR R
  Analytic Deploer utility will understand that Y is the
  first argument passed into the function, followed by one
  or more X variables.  \item A predictive analytical
  function supports one target variable Y (the dependent
  variable) and an indeterminate number of explanatory,
  independent variable pairs, X1 and X2, with X1 as numeric
  identifier for an item and X2 as its text description. By
  configuring Y as the first input, X1 as the second, X2 as
  the third, and setting the Repeat Count to 2, this
  defines that Y is the first argument and there can be one
  or more pairs of X1 and X2 variables passed into the R
  script.  \item NOTE: Each individual repeated variable
  must be of the same data type, either string or numeric.
  If default is selected, the data type is determined by
  the first occurrence. }

  The \strong{Metric Specification} section contains the
  following options: \itemize{ \item \strong{Nulls Allowed}
  controls whether records containing null values are to be
  passed in as inputs to your analytic. By default this
  option is selected. If unselected, all records containing
  null values are eliminated from the analysis \item
  \strong{Check Input Count} controls whether MicroStrategy
  ensures that the number of inputs to the metric matches
  exactly with the number of inputs specified in the
  function's signature. By default, the option is selected.
  If selected and the number of inputs is different, a
  specific warning message will be returned to the user.
  If unchecked and the number of inputs is different, the
  script execution will attempt to proceed.  \item
  \strong{Enable Sort By} controls the sorting of records
  before being passed to R. By default, the option is
  selected. If this option is selected, the first input
  must be a vector, since the default behavior sorts
  records in ascending order by the first input. To specify
  a particular sorting criterion, you can specify the Sort
  By value in the field below the check box. If this option
  is cleared, the order of records passed into R is
  determined by MicroStrategy automatically.  \item
  \strong{Specify Working Directory} allows you to specify
  a working directory for R. By default, this option is
  cleared. To select a working directory select the check
  box and specify a working directory in the field below
  the check box. If this option is selected, MicroStrategy
  does not alter R's working directory, which is otherwise
  determined by R.  \item \strong{Output Variable} allows
  the user to control which output is returned to
  MicroStrategy. The first output is the default and does
  not need to be specified in the metric expression. }

  After you have configured the variables and specified the
  metric options, you can save the analytic's signature to
  the R script by clicking the \strong{Save} button.
  Alternatively, you can use the \strong{Preview} button to
  review the changes before saving.

  Finally, after configuring your variables, saving the
  signature to your script and specifying the metric
  options, the R Analytic Deployer provides you with the
  metric expression for your analytic.  The \strong{Metric
  Expression} section at the bottom-right of the dialog
  shows the metric expression that defines how
  MicroStrategy interacts with your function.  Click the
  \strong{Copy to Clipboard} button and you're ready to
  paste this metric expression into any MicroStrategy
  Metric Editor (Desktop, Web and Visual Insight).
}
\examples{
\dontrun{
deployR()}
}
\references{
  MicroStrategyR.
  \url{http://RIntegrationPack.codeplex.com/}.
}
\keyword{microstrategy}

