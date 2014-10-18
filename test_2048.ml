open OUnit
open Jeu2048

let test_0 = 
let g = Array.init 16 (fun x -> 1+x) in
let r = Jeu2048.extract g Down 0 in
"Basic" >::: 
[
(*
	"foo" >:: (fun () -> 
		   assert_equal [1;5;9;13] (Jeu2048.extract g Down 0)
	);
*)
	"truc" >:: (fun () -> 
		   assert_equal [1;5;9;13] (Jeu2048.extract g Up 0)
	);
(*
	"bar" >:: (fun () ->
		assert_equal [13;9;5;1] (Jeu2048.extract g Up 0)
	);
*)
	"bar" >:: (fun () ->
		assert_equal [13;9;5;1] (Jeu2048.extract g Down 0)
	);
];;

let _ = run_test_tt ~verbose:false test_0;;
