part of funkymath.functions;
MathFunction root(num exponent){
    return new MathFunction((num base){
        return _nthroot(base, exponent);
    });
}

num _nthroot(num x, int n){
    num epsilon = 0.0001;
    num xcurrent = x;
    var iterate = (num i) => (1/n)* (((n-1)*i) + x/(power(n-1)(i)));
    num xnext = iterate(xcurrent);
    while((xnext - xcurrent).abs() > epsilon ){
        xcurrent = xnext;
        xnext = iterate(xcurrent);
    }
    return xnext;
}