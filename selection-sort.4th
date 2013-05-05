( 
vim: set filetype=forth : 
) 


include array-io.4th


: selection_sort_iteration ( addr m -- )
{ arr m }
0
m 0 ?do
    dup cells arr + @ arr i cells + @ < if 
        drop 
        i
    then 
loop
dup cells arr + @
m 1 - cells arr + @
swap 
m 1 - cells arr + !
over cells arr + !
drop
;


: selection_sort ( addr n -- )
{ arr n } 
n 1 - 0 ?do
    arr n i - 
    selection_sort_iteration
loop
;


variable arr 100 cells allot
variable n     1 cells allot

arr read_arr 
n !
arr n @ selection_sort
arr n @ print_arr

bye

