( 
vim: set filetype=forth : 
) 


128 Constant MAX_LINE


: read_arr ( addr -- n )
{ arr }
0
begin 
    pad MAX_LINE stdin read-line 
    drop 
while
    0 0 pad 3 roll >number 
    drop
    drop
    drop
    over cells arr + ! 
    1 +
repeat 
drop
;


: print_arr ( addr n -- )
{ arr n } 
n
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


( 
variable arr 100 cells allot
variable n     1 cells allot

arr read_arr 
n !
arr n @ print_arr

bye
) 
