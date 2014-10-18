open Core;;
open Jeu2048;;


let g0 = [|0;0;2;2;
           4;4;0;0;
           0;4;2;2;
           4;0;4;0|];

print_game g0
print_endline

insert g0 Up 0 [0;0;0;0]

print_game g0
print_endline
