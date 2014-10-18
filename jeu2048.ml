open Core.Std


type direction = Up | Down | Left | Right;;

let print_game g =
	for i = 0 to 3 do
		print_endline "+-----+-----+-----+-----+";
		print_string "|";
		for j = 0 to 3 do
			Printf.printf "%4d |" g.(i*4+j)
		done;
		print_endline "";
	done;
	print_endline "+-----+-----+-----+-----+";;

let rec reduce l =
	match l with 
	| [] -> [],false
	| [x] -> [x],false
	| x::y::tl ->  if (x=y) then (2*x)::fst(reduce(tl)),true else
		       let r = reduce(y::tl) in
		       		(x::fst(r)),snd(r)
;;

let extract g dir index =
	let incr,start = match dir with
		| Up -> -4,12+index
		| Down -> 4,0+index
		| Left -> -1,3+4*index
		| Right -> 1,0+4*index
	in
	List.fold [start;start+incr;start+2*incr;start+3*incr]
		~init:[] ~f:(fun l x -> g.(x)::l) ;;	
(*

let insert g dir index l =
	let incr,start = match dir with
		| Up -> -4,12+index
		| Down -> 4,0+index
		| Left -> -1,3+4*index
		| Right -> 1,0+4*index
	in
	List.fold ~init:start ~f:(fun x -> 
*)

let t1 = [|0;2;4;0;
	   0;2;2048;0;
           2;2;0;0;
	   4;4;2;2|];;

print_game t1;;
extract t1 Down 3 |> List.iter ~f:(fun x -> Printf.printf "%d," x);
print_endline "";
extract t1 Up 2 |> List.iter ~f:(fun x -> Printf.printf "%d," x);
print_endline "";
extract t1 Left 1 |> List.iter ~f:(fun x -> Printf.printf "%d," x);
print_endline "";
extract t1 Right 0 |> List.iter ~f:(fun x -> Printf.printf "%d," x);
print_endline "";

let g = Array.init 16 (fun x -> 1+x) in
extract g Up 0 |> List.iter ~f:(fun x -> Printf.printf "%d," x);
print_endline "";
let g = Array.init 16 (fun x -> 1+x) in
extract g Down 0 |> List.iter ~f:(fun x -> Printf.printf "%d," x);
print_endline "";
