## Test Environment

local debian Jessie, R 3.2.0

devtools::build_win()

## R CMD check results

There were no errors or warnings either on the local build or on
win-builder.

win-builder contained one note about possible misspelled words,
however, upon closer inspection, these words were functions and commands
referenced in the description and were spelled correctly.

## Downstream dependencies

This package currently has no downstream dependencies.
