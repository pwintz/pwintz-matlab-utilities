# Paul Wintz MATLAB utilities
This repository contains functions that I use in other projects. 

## Setup
To use this package in other projects, add the path to the file containing `+pwintz/` to your MATLAB path.


## Project Structure

### Conditionals

There are three packages that relate to conditional checks: 

* `pwintz.assertions`
* `pwintz.valdiators`

Along with some in

* `pwintz.arrays`
* `pwintz.logical`

In general, for each assertion function `assertX` or `assertIsX` in `pwintz.assertions`, we should have a corresponding function `mustBeX` in `pwintz.validators`. 

## Coding Style
