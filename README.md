Funky Math library
==================

This is a math library written in Dart with the goal of having a simple syntax for doing math in Dart and amassing a large collection of math functions and constructs.

Example usage:

1. Using defined functions
    1. Square a number
    
            var x = 5;
            print(power(2)(x)); // 25

    2. Raise a number to an arbitrary power

            var x = 3;
            var myexponent = 4;
            print(power(myexponent)(x)); // 81

    3. Define a square function and use it

            var square = power(2);
            print(square(3)); //9

    4. Define an exponentiation function (e.g. 2^x)

            var doublingexp = raise(2);
            print(doublingexp(10)); //1024

2. Using derivatives (note: derivatives are given as approximations)
    1. Define a function as a derivative of another function

            var square = power(2);
            var doubling = square.derivative;
            print(doubling(4));   //8.000000000001783

    2. Chain derivatives to get higher order derivatives

            var square = power(2);
            var two = square.derivative.derivative;
            print(two(4)); // 2.0000000020559128

3. Finding the area under a curve 
    1. Calculate the area under f(x) = x^2 from x = 1 to x = 4
    
            var square = power(2);
            print(square.area(1,4)); // 21.00850049999708

4. Defining your own functions
    1. Using functions (i.e. curly braces)
    
            var square = new MathFunction((num x){
                return x*x;
            });

            print(square(3)); //9

    2. Using lambda expressions
        
            var cube = new MathFunction((num x) => x*x);
            
<<<<<<< HEAD
            print(cube(2)); //8
=======
            print(cube(2)); //8
>>>>>>> FETCH_HEAD
