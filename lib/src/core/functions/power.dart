part of funkymath.functions;
MathFunction power(num exponent){
    return new MathFunction((num base){
        return _expBySquaring(base, exponent);
    });
}

/*MathFunction raise(num base){
    return new MathFunction((num exponent){
        return _expBySquaring(base, exponent);
    });
}*/

num _expBySquaring(num x, num n){
    if (n < 0){
        return _expBySquaring(1/x, -n);
    }else if (n == 0){
        return 1;
    }else if (n == 1){
        return x;
    }else if (n%2 == 0){
        return _expBySquaring(x*x, n/2);
    }else{
        return x * _expBySquaring(x*x, (n-1)/2);
    }
}