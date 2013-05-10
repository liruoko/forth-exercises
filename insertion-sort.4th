( 
vim: set filetype=forth : 
) 


include array-io.4th


: arr_shift ( arr d -- ) ( arr[d] = arr[d-1] )
{ arr d } 
arr d 1 - cells + @
arr d cells + !
;


: insertion_sort_iteration ( addr n -- )
{ arr n } 
arr n 1 - cells + @ ( arr[n-1] )
0 ( d )
begin 
n over - 1 - 0 > 
arr n 3 pick - 2 - cells + @ 3 pick >  ( arr[n-1-d] > arr[n-1] )
and 
while
arr n 2 pick - 1 - arr_shift 
1 + 
repeat
n swap - 1 - cells arr + !
;


: insertion_sort ( addr n -- )
{ arr n } 
n 1 + 1 ?do
    arr i 
    insertion_sort_iteration
loop
;


variable arr 100 cells allot
variable n     1 cells allot

arr read_arr 
n !
arr n @ insertion_sort
arr n @ print_arr

bye

