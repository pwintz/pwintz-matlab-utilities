# Paul Wintz MATLAB utilities
This repository contains functions that I use in other projects. 

## Setup
To use this package in other projects, add the path to the file containing `+pwintz/` to your MATLAB path.


## Design Principles

### Data representation of vectors in $\mathbb{R}^n$ 
This project is designed so that vectors in $\mathbb{R}^n$ are stored as column arrays. A collection of $m$-many vectors are stored as $m$-man columns in an $n \times m$ matrix. 
By consistently using this convention, we can apply a linear `A` to a set of vectors `V` using 
```matlab
A * V;
```
In contrast, if we were to store vectors in rows, then, we would need to use `transpose(A * transpose(V))`.
  
### Function Definitions
In general, we prefer defining many specific functions over a few general functions that use a set of options to select between different handling of rows vs. columns vs. entries. 
For example, we define: 
```matlab
  pwintz.arrays.isEntryIn
  pwintz.arrays.isRowIn
  pwintz.arrays.isColumnIn
```
These functions subsume the behavior of MATLAB's `ismember` and `ismembertol` functions.

### Lists of scalar values
Whenever we create a list of scalar values, the values are provided in a row vector.  

One exception is when we return a list of row numbers, in which case we provide the index of each row in the corresponding row of a column vector.

### Conditionals

There are two sub-packages provide conditional checks for  

* `pwintz.assertions`: Provides checks that are used inside functions or scripts to assert that some expected relation is satisfied, such as `pwintz.assertions.assertNonEmpty(value)`. T  
* `pwintz.valdiators`: Provides validators for use in `properties` and `arguments` blocks.

In general, for each assertion function `assertX` or `assertIsX` in `pwintz.assertions`, we should have a corresponding function `mustBeX` in `pwintz.validators`. 

There are also some functions that provide conditional logic in 

* `pwintz.arrays`: See `isColumnIn`, `isRowIn`
* `pwintz.logical`
* `pwintz.unittest.TestCase`

### Error Messages
This package prefers to use verbose but informative error messages instead of terse messages that do not provide much detail about the problem. 
The `pwintz.error` function makes it easier to provide informative error strings.  