# take care of R CHECK's NOTE about "no visible binding for global variable '.'"
# see https://github.com/tidyverse/magrittr/issues/29
if(getRversion() >= "2.15.1")  utils::globalVariables(c("."))
