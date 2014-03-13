part of funkymath.functions;
/*
 * Generic class for math functions 
 * TODO: allow for multivariate functions
 * NOTE: currently only functions of type f: R -> R are supported
 * 
 * The point of this class is to be able have functions that
 * also have class members and methods. This would make it
 * easier to query math functions for different properties
 * 
 * */
class MathFunction{
    /*
     * Private field to store the function definition
     * When created, a new MathFunctions accepts a Dart Function
     * as an argument. It is stored in this private variable
     * 
     * */
    Function _definition;
    
    /*
     * Base Constructor for MathFunction class.
     * Input: Dart Function or Lambda expression
     * 
     * Example: >>> MathFunction square = new MathFunction((num x) => x*x);
     * 
     * Example: >>> MathFunction cube   = new MathFunction((num x){
     *          >>>     return x*x*x;
     *          >>> }); 
     * 
     * */
    MathFunction(Function definition){
        this._definition = definition;
    }
    
    /*
     * Call method the enables using a class like a function
     * Example: >>> MathFunction square = new MathFunction((num x) => x*x);
     *          >>> num x = 3;
     *          >>> num y = 8;
     *          >>> num sqx = square(x);
     *          >>> num sqy = square(y);
     *          >>> print(sqx); // 9
     *          >>> print(sqy); // 64 
     * 
     * */
    num call(num x){
        return this._definition(x);
    }
    
    /*
     * Getter used to return an approximation of the derivative of the current MathFunction
     * Example: >>> MathFunction square = new MathFunction((num x) => x*x);
     *          >>> MathFunction doublingFunction = square.derivative;
     *          >>> var x = 4;
     *          >>> print(doublingFunction(x)); // 8.000000000001783
     *          
     * Note: the use of getters enable easy chaining of derivative calls
     *       this can easily be used to get higher order derivatives
     * 
     * Example: >>> MathFunction square = new MathFunction((num x) => x*x);
     *          >>> MathFunction two = square.derivative.derivative;
     *          >>> var x = 4;
     *          >>> print(two(x)); //2.0000000020559128
     * 
     * */
    MathFunction get derivative{
        num h = 0.001;
        return new MathFunction((num x){
            return (this(x+h) - this(x-h))/(2*h);
        });
    }
    
    /*
     * Method to find signed area or definite integral of a mathfunction
     * This is calculated using Riemann's sums
     * Example: >>> MathFunction square = new MathFunction((num x) => x*x);
     *          >>> var areafrom1to4 = square.area(1,4); 
     *          >>> print(areafrom1to4); // 21.00850049999708
     * 
     * */
    num area(num start, num finish){
        num h = 0.001;
        num begin = Math.min(start, finish);
        num end = Math.max(start, finish);
        num sign = (finish > start) ? 1 : -1;
        num result = 0;
        for (num x = begin; x < end; x+=h){
            result += this(x) * h;
        }
        return result * sign;
    }
}