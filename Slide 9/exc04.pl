maximo([X], X).
maximo([X|Y], Max) :- (maximo(Y, Max1), (Max1 > X), Max is Max1) ;
                      (maximo(Y, Max1), (Max1 < X), Max is X).
