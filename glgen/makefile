all:
	ocamlc -c data.mli
	ocamlc -c data.ml
	ocamlyacc glparse.mly
	ocamlc -c glparse.mli
	ocamlc -c glparse.ml
	ocamllex gllex.mll
	ocamlc -c gllex.ml
	ocamlc data.mli data.ml glparse.mli glparse.ml gllex.ml main.ml -o glgen
	rm -rf output
	mkdir output

	./glgen data/glcaml.txt output/glcaml.ml output/glcaml_stub.c
	ocamlc -i output/glcaml.ml > output/glcaml.tmp.mli
	cat data/mliheader.ml output/glcaml.tmp.mli > output/glcaml.mli
	rm output/glcaml.tmp.mli

	./glgen data/glescaml.txt output/glescaml.ml output/glescaml_stub.c
	ocamlc -i output/glescaml.ml > output/glescaml.tmp.mli
	cat data/mliheader.ml output/glescaml.tmp.mli > output/glescaml.mli
	rm output/glescaml.tmp.mli

	cp output/* ../lib

clean:
	rm -f *.o *.cmi *.cmo glparse.mli glparse.ml gllex.ml glgen output/*	
