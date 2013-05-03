( 
vim: set filetype=forth : 

this script reads integer numbers from stdin 
/one number pro line, empty lines are treated as zeros/
and sorts them using simple bubble sort algorithm. 

> cat numbers
1
1024
13
46
13
888
45
46
44
91

> cat numbers|gforth bubble-sort.fth 
1 
13 
13 
44 
45 
46 
46 
91 
888 
1024 

) 

create str  101 chars allot
create arr 10000 cells allot 
variable len


: read_arr ( -- n )
0
begin 
    str 100 stdin read-line 
    drop 
while
    len !
    0 0 str len @ >number 
    drop
    drop
    drop
    over cells arr + ! 
    1 +
repeat 
drop
;


: print_arr ( n -- )
0
begin 
    over over > 
while
    dup cells arr + @ . cr
    1 +
repeat
drop 
drop
;


: iteration ( n -- )
dup 1 - 0 ?do
    i cells arr + @ i 1 + cells arr + @ > if 
    i cells arr + @ 
    i 1 + cells arr + @
    swap 
    i 1 + cells arr + !
    i cells arr + !
    then
loop
drop
;


: sort_arr ( n -- ) 
dup 1 - 0 ?do
    dup iteration
    \ cr dup print_arr 
loop
drop
;


read_arr 
dup sort_arr
dup print_arr
drop
bye

