( 
reverses the order of words in every line of input text

> cat > text
abcd efghi jklm n op q rst      
123 4 5678 9 0

> cat text 
abcd efghi jklm n op q rst
123 4 5678 9 0

> cat text |gforth reverse-words.ft
abcd efghi jklm n op q rst 
rst q op n jklm efghi abcd
123 4 5678 9 0 
0 9 5678 4 123
) 

variable str
variable len

: rev { s l } ( c-addr u -- )
l 2 / 0 ?do
    s i chars + c@ 
    s l i - 1 - chars + c@
    swap 
    s l i - 1 - chars + c!
    s i chars + c!
loop 
;

\ call rev for every word in string
: w-rev { s l } ( c-addr u -- )
0
0
l 0 ?do
    s over 3 pick + chars + c@ 32 = l 1 - i = or if 
        l 1 - i = if 1 + then
        s 2 pick chars + over rev
        + 
        1 +
        0
    else 
        1 +
    then
loop
;

: reverse-words { s l } ( s l -- )
    s l @ rev
    s l @ w-rev
;

: run 
begin 
str 200 accept
cr
len !
str len reverse-words
str len @ type
cr
false  until
;

run

bye

