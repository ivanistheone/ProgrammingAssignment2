
Scoping assignment test
=======================

Suppose we want to make a raise-to-exponent function generator,
that also allows you to change the exponent later on.
This can be done using the `<<-` operator:

    make.pow <- function(n) {
        pow <- function(x, changepow=NULL){
            if (is.numeric(changepow)) {
                n <<- changepow
            }
            x^n 
        }
        pow
    }

The function works as expeceted:

    > cube = make.pow(3)
    > cube(2)
    [1] 8

And adding the optional `changepow` will modify the current call,
and because we're using `<<-` the scope where the function was defined
is also modified so the function now acts as a fourth power (nevermind the name):

    > cube(2, changepow = 4)
    [1] 16
    > cube(2)
    [1] 16

To understand the need for `<<-` instead of just `<-` compare what happens:

    make.pow <- function(n) {
        pow <- function(x, changepow=NULL){
            if (is.numeric(changepow)) {
                n <- changepow
            }
            x^n 
        }
        pow
    }

Basic functionality works:

    > cube = make.pow(3)
    > cube(2)
    [1] 8

But using `changepow` will only have an effect on the current invocation, not subsequent ones:

    > cube(2, changepow = 4)
    [1] 16
    > cube(2)
    [1] 8


Apparenlty `x <<- val` is the same as `assign(x, val, inherits=TRUE)`.


