part of funkymath.functions;
MathFunction raise(num base){
    return new MathFunction((num exponent){
        return _expBySquaring(base, exponent);
    });
}