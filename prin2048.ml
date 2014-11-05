open Core;;
open Jeu2048;;


let g0 = [| 0;0;2;2; 4;4;0;0; 0;4;2;2; 4;0;4;0 |];;

print_game g0;;
print_endline;;

insert g0 Up 0 [0;0;0;0];;
print_game g0;;
print_endline;;

insert g0 Up 0 [0;2;4;8];;
print_game g0;;
print_endline;;

insert g0 Down 0 [0;2;4;8];;
print_game g0;;
print_endline;;

insert g0 Down 0 [16;32];;
print_game g0;;
print_endline;;

insert g0 Down 2 [64;128];;
print_game g0;;
print_endline;;



insert g0 Up 3 [64;128];;
print_game g0;;
print_endline;;

move g0 Up;;
print_game g0;;
print_endline;;
print_endline;;
let g0 = [| 0;0;2;2; 4;4;0;0; 0;4;2;2; 4;0;4;0 |];;
print_game g0;;
print_endline;;
let g0,v = move g0 Right;;
print_game g0;;
print_endline;;
let g0,v = move g0 Up;;
print_game g0;;
print_endline;;
