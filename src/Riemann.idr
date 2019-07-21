module Integration.Riemann


%access private


||| Computes the left Riemann sum of a function.
|||
||| @f  the function
||| @d  the delta x value
||| @a  the left limit of the interval
||| @n  the number of subintervals
export
lrs : (f : Double -> Double) -> (d : Double) -> (a : Double) -> (n : Nat) -> Double
lrs f d s Z = 0
lrs f d a (S n') = d * (lrs' n') where
  lrs' : (i : Nat) -> Double
  lrs' Z = f a
  lrs' i@(S i') = (f (a + ((cast i) * d))) + (lrs' i')


||| Computes the right Riemann sum of a function.
|||
||| @f  the function
||| @d  the delta x value
||| @a  the left limit of the interval
||| @n  the number of subintervals
export
rrs : (f : Double -> Double) -> (d : Double) -> (a : Double) -> (n : Nat) -> Double
rrs f d a Z = 0
rrs f d a n@(S n') = d * (rrs' n) where
  rrs' : (i : Nat) -> Double
  rrs' Z = 0
  rrs' i@(S i') = (f (a + ((cast i) * d))) + (rrs' i')


||| Approximates the integral of a function using the trapezoidal rule.
|||
||| @f  the function
||| @d  the delta x value
||| @a  the left limit of the interval
||| @n  the number of subintervals
export
trapz : (f : Double -> Double) -> (d : Double) -> (a : Double) -> (n : Nat) -> Double
trapz f d a n = ((lrs f d a n) + (rrs f d a n)) / 2
