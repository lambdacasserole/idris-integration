# Riemann Integral Approximation in Idris
Riemann approximation of integrals in Idris.

## Installation
This is just a standard Idris package file. You can find instructions for installing it [in the official documentation](http://docs.idris-lang.org/en/latest/tutorial/packages.html). Briefly, however, this'll do it:

```bash
idris --build integration.ipkg
idris --install integration.ipkg
idris --clean integration.ipkg
````

## Usage
The API here is currently very minimal. You can compute the left or right Riemann sums of a function, or apply the trapezoidal rule to approximate its integral.

```idris
-- scratch.idr

import Integration.Riemann

y_equals_x_squared : Double -> Double
y_equals_x_squared x = x * x
```

Now, loads `scratch.idr` by invoking `idris scratch.idr` and try the following:

```idris
> :module Integration.Riemann
> rrs y_equals_x_squared 1 0 5
55.0 : Double
> lrs y_equals_x_squared 1 0 5
30.0 : Double
> trapz y_equals_x_squared 1 0 5
42.5 : Double
```

## Future Work
It would be nice to define the trapezoidal rule separately and then prove that it is equivalent to the average of the right and left Riemann sums. Unfortunately I'm currently not sure where to start with this, whether or not the definitions in this library are amenable to this, or whether it is even possible right now.
