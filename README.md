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
* tractable problems: 
  A problem is called tractable iff there is an algorithm with polynomial (O(n^b) of some b) worst-case complexity.
  (There is no guarantee that a tractable problem can be solved in a reasonable time.)

* unsolvable problems: 
  A problem is unsolvable iff no algorithm exists for solving them.
  The first instance is the famous halting problem (Alan Turing).
  (See also 4.2 of Haskell road to logic.)

* class NP: 
  Many solvable problems are believed to have the property that no algorithm with polynomial worst-case time complexity solves them, but a solution, if exists, can be checked in polynomial time.
  Such a class of problems form the class NP.

* NP-complete problems: 
  If any of NP-complete problems can be solved by a polynomial worst-case time algorithm, then all the problems can be solved by polynomial worst-case time algorithms.
  So far no-proof or no-counterexample have been found, it is generally accepted that no NP-complete problem can be solved in polynomial time. 

### 2.3 The Integers and Division
* division
* gcd

### 2.4 Integers and Algorithms
* Euclidean algorithm
* Representations of integers
  * binary expansion
  * binary addition
  * binary multiplication

### 2.5 Applications of Number Theory
* Extended Euclidean algorithm
* Chinese Remainder Theorem

### 2.6 Matrices
* Libraries:
  * [http://hackage.haskell.org/package/hmatrix-0.20.0.0/docs/Numeric-LinearAlgebra.html](http://hackage.haskell.org/package/hmatrix-0.20.0.0/docs/Numeric-LinearAlgebra.html)
  * [http://hackage.haskell.org/package/hmatrix-0.20.0.0/docs/Numeric-LinearAlgebra-Static.html](http://hackage.haskell.org/package/hmatrix-0.20.0.0/docs/Numeric-LinearAlgebra-Static.html)

* Tutorials, Examples, etc
  * An introduction: 
  [http://dis.um.es/~alberto/hmatrix/hmatrix.html](http://dis.um.es/~alberto/hmatrix/hmatrix.html)

## Chapter 03
Mathematical Reasoning

### 3.1 Methods of Proof
* Rules of inference ([infer](https://www.merriam-webster.com/dictionary/infer): to derive as a conclusion from facts or premises) 

Rules                  | Tautology
-----                  | ---------
Addition               | `p -> (p \|\| q)`
Simplification         | `(p && q) -> p`
Conjunction            | `((p) && (q)) -> (p && q)`
Modus ponens           | `( p && (p->q))`
Modus tollens          | `((not p) && (p->q)) -> (not p)`
Hypothetical syllogism | `((p->q) && (q->r)) -> (p->r)`
Disjunctive syllogism  | `((p \|\| q) && (not p)) -> q`

* Methods of proving theorems
  * direct proof
  * indirect proof 
    * vacuous proof `False -> q`
    * trivial proof `p -> True`
    * proof by contradiction

* The Halting Problem

### 3.2 Mathematical Induction
* The well-ordering property

Every non-empty set of non-negative integers (i.e., natural numbers) has a least element.

* Mathematical Induction
  1. Base case: the proposition `p(0)`(or `p(1)`) is shown to be true.
  1. Induction step: the implication `p(n) -> p(n+1)` is shown to be true for every positive integer (i.e., a natural number) n.

Here, the statement P(n) for a __fixed__ n is called the inductive hypothesis.

* The Second Princple of Mathematical Induction
  1. Base case: the proposition `p(0)` (or `p(1)`) is shown to be true.
  1. Induction step: `(p(0) && .. && p(n)) -> p(n+1)` is shown to be true for any n.

### 3.3 Recursive Definitions

* [https://www.cs.nott.ac.uk/~pszgmh/fold.pdf](https://www.cs.nott.ac.uk/~pszgmh/fold.pdf)

### 3.4 Recursive Algorithms
A naive factorial would be

```haskell
factorial 0 = 1
factorial n = n * factorial (n-1)
```

There exist more efficient and fast algorithms:
*FFF of [FastFactorialFunctions](http://www.luschny.de/math/factorial/FastFactorialFunctions.htm)
*A Haskel implementation by konn-san: [https://github.com/konn/factorials](https://github.com/konn/factorials)

### 3.5 Program Correctness

## Chappter 04
Counting

### 4.1 The Basics of Counting

### 4.2 The Pigeonhole Principle

### 4.3 Permutations and Combinations

### 4.4 Discrete Probability

### 4.5 Probability Theory

### 4.6 Generalized Permutations and Combinations

### 4.7 Generating Permutations and Combinations
