open Core.Std
open Random


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
	let l = List.filter l (fun x -> not (x = 0)) in
	match l with 
	| [] -> [],false
	| [x] -> [x],false
	| x::y::tl ->  if (x=y) then (2*x)::fst(reduce(tl)),true else
		       let r = reduce(y::tl) in
		       		(x::fst(r)),snd(r)
;;

let extract g dir index =
	let incr,start = match dir with
		| Up    -> -4,12+index
		| Down  ->  4,0+index
		| Left  -> -1,3+4*index
		| Right ->  1,0+4*index
	in
	List.fold [start;start+incr;start+2*incr;start+3*incr]
		~init:[] ~f:(fun l x -> g.(x)::l) ;;	

let insert g dir index data =
	let incr,start = match dir with
		| Up    ->  4,index
		| Down  -> -4,12+index
		| Left  ->  1,0+4*index
		| Right -> -1,3+4*index
	in
	let s = ref start in
	List.iter data ~f:(fun x -> g.(!s) <- x; s:= !s+incr);;

let move game dir = 
	let valid = ref false in 
	let r = [|0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0|] in
	for i = 0 to 3 do
		let l = extract game dir i in
		let ll,v = reduce l in
			valid := (!valid || v);
			insert r dir i ll
	done;
	r,not(r = game);;

let random_set game =
	let zeros = Array.fold game 
            ~init:0 ~f:(fun c x -> if (x=0) then c+1 else c ) in
		if zeros=0 then
			failwith "terminé"
		else 
			let pos = (Random.int zeros) in
			let value = 2 * (1+(Random.int 2)) in
			let pos_zero = ref 0 in
			for i = 0 to (Array.length game) - 1 do
				if game.(i) = 0 then 
				begin
					if (!pos_zero) = pos then 
					begin
						(* Printf.printf "i=%d, val=%d\n" i value; *)
						game.(i) <- value;
					end;
					pos_zero := !pos_zero+1;
				end
			done
