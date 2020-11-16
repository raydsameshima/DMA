# DMA
A note on "Discrete Mathematics and Its Applications 4ed" (Kenneth H. Rosen)

## Chapter 01
The Foundations: Logic, Sets, and Functions

### 1.1 Logic
Boolean and bit operations

bit comes from binary digits (by John Tukey)

[Data.Bits](https://hackage.haskell.org/package/base-4.14.0.0/docs/Data-Bits.html) provides bitwise operations for integers.

### 1.2 Propositional Equivalences
For small cases, a truth table can be used to determine two propositions are equivalent or not.

### 1.3 Predicates and Quantifiers
* universal quantifier 
  * "for all x P(x)" 
  * "for every x P(x)"


* existential quantifier 
  * "there is an x such that P(x)"
  * "there is at least one x such that P(x)"
  * "for some x P(x)"

### 1.4 Sets
Cantor's naive set theory

### 1.5 Set Operations

[Data.Set](https://hackage.haskell.org/package/containers-0.6.4.1/docs/Data-Set.html)

[sets introduction](https://haskell-containers.readthedocs.io/en/latest/set.html)

### 1.6 Functions
* A function f injective iff (f(x) = f(y) ==> x = y).

* A function f:A->B is surjective iff B=f(A).

### 1.7 Sequences and Summations
* Example 17 (Cantor's diagonal argument)

### 1.8 The Growth of Functions
* Big-O Notation
f is O(g) iff there exists a constants C and k such that for any x>k, |f(x)| <= C*|g(x)|.

  * O(1)
  * O(log n)
  * O(n)
  * O(n * log n)
  * O(n^2)
  * O(n!)

* Big-Omega and Big-Theta notation 
f is Omega(g) iff there exists a constants C and k such that for any x>k, C*|g(x)| <= |f(x)|.

f is Theta(g) iff f is O(g) and f is Omega(g).
We say that f is of order g.

## Chapter 02
The Fundamentals: Algorithms, the Integers, and Matrices

### 2.1 Algorithms
* An algorithm is a finite set of (precise) instructions ("how to") for performing a computation.

* Pseudocode = an intermediate step between an English description and an actual programming language.
  * procedure statements
  * assignments
  * block
  * comments
  * conditional constructions (if, then, else)
  * loop constructions (for, while)

### 2.2 Complexity of Algorithms
* tractable problems
A problem is called tractable iff there is an algorithm with polynomial (O(n^b) of some b) worst-case complexity.
(There is no guarantee that a tractable problem can be solved in a reasonable time.)

* unsolvable problems
iff no algorithm exists for solving them

The first instance is the famous halting problem (Alan Turing).
(See also 4.2 of Haskell road to logic.)
