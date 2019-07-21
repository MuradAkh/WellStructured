countAST: src/countAST.ml
	ocamlbuild -Is src -use-ocamlfind -package cil countAST.cma countAST.cmxs

extractLoop: src/countAST.ml
	ocamlbuild -Is src -use-ocamlfind -package cil extractLoop.cma extractLoop.cmxs

extractMLC: src/countAST.ml
	ocamlbuild -Is src -use-ocamlfind -package cil extractMLC.cma extractMLC.cmxs

countCFG: src/countCFG.ml`
	ocamlbuild -Is src -use-ocamlfind -package cil countCFG.cma countCFG.cmxs

countCFGnested: src/countCFGnested.ml
	ocamlbuild -Is src -use-ocamlfind -package cil countCFGnested.cma countCFGnested.cmxs

run-countAST: countAST
	cilly --gcc=/usr/bin/gcc-6 --save-temps --load=_build/src/countAST.cmxs  file.c 

run-countCFG: countCFG 
	cilly --gcc=/usr/bin/gcc-6 --load=_build/src/countCFG.cmxs  file.c 

run-countCFGnested: countCFGnested
	cilly --gcc=/usr/bin/gcc-6 --load=_build/src/countCFGnested.cmxs  file.c 

run-extractLoop: extractLoop
		cilly --gcc=/usr/bin/gcc-6 --save-temps --load=_build/src/extractLoop.cmxs  file.c 
		cat file.cil.c | grep -v '^#line' > output.c

run-extractMLC: extractMLC
		cilly --gcc=/usr/bin/gcc-6 --save-temps --load=_build/src/extractMLC.cmxs  file.c 
		cat file.cil.c | grep -v '^#line' > output.c

clean:
	rm a.out file.cil.c file.cil.i file.i file.o output.c
