USING: kernel io io.files io.encodings.utf8 math math.parser math.ranges splitting sequences sequences.deep sequences.repeating assocs fry prettyprint vectors ;


"input.txt" utf8 file-lines
[ " " split ] map flatten 
[ dup [ = ] curry "noop" "addx" rot either? [ drop 0 ] [ string>number ] if ] map 
20 220 40 <range> 
[ [ '[ dup 1 _ 1 - rot <slice> ] call 1 [ + ] reduce ] keep * ]  map 
0 [ + ] reduce . 
1 [ + ] accumulate* 
>vector [ pop* ] keep { 1 } prepend 
0 39 1 <range> 240 cycle swap zip 
[ first2 - abs 1 <= [ "#" ] [ "." ] if ] map 
0 200 40 <range> 40 240 40 <range> zip 
[ '[ dup _ first2 rot <slice> ] call ] map [ "" join ] map 
"output.txt" utf8 set-file-lines 
drop
