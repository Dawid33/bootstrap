set -x

( cd 00; ./hexcompile; )
(
  cd 01;
  ../00/hexcompile;
  ./out00;
)
(
  cd 02;
 	../01/out00;
	./out01;
)
(
  cd 03;
 	../02/out01;
	./out02;
)
(
  cd 04;
 	../03/out02;
	./out03;
)
(
  cd 04a;
 	../04/out03;
	./out04;
)
(
  TCCDIR=tcc-0.9.27
  TCC=tcc-0.9.27/tcc
  TCC0=tcc-0.9.27/tcc0
  TCCINST=tcc-bootstrap
  cd 05;
	../04a/out04 main.b in04
	../04/out03 in04 out04
	./out04

  (cd $TCCDIR && ../out04 tcc.c tcc0)

  $TCC0 -c $TCCDIR/lib/alloca86_64-bt.S -o $TCCDIR/lib/alloca86_64-bt.o
  $TCC0 -c $TCCDIR/lib/alloca86_64.S -o $TCCDIR/lib/alloca86_64.o
  $TCC0 -c $TCCDIR/lib/va_list.c -o $TCCDIR/lib/va_list.o
  $TCC0 -c $TCCDIR/lib/libtcc1.c -o $TCCDIR/lib/libtcc1.o
  $TCC0 -ar $TCCDIR/lib/libtcc1.a $TCCDIR/lib/*.o

	mkdir -p $TCCINST/include
	cp -r $TCCDIR/include/*.h $TCCINST/include/
	cp -r $TCCDIR/lib/libtcc1.a $TCCINST/

	mkdir -p musl-bootstrap/include
	mkdir -p musl-bootstrap/bin
	mkdir -p musl-bootstrap/lib
	mkdir -p musl-0.6.0/lib
	(cd musl-0.6.0 && ash ./build.sh)

	(cd $TCCDIR && ./tcc0 -g -static -nostdinc -nostdlib -B ../tcc-bootstrap -I ../musl-bootstrap/include tcc.c ../musl-bootstrap/lib/*.[oa] -o tcc)

	mkdir -p musl-bootstrap-final/include
	mkdir -p musl-bootstrap-final/bin
	mkdir -p musl-bootstrap-final/lib
	(cd musl-final && ash ./build.sh)

	mkdir -p tcc-final/out
	(cd tcc-final && ../$TCCDIR/tcc -Wall -g -static -nostdinc -nostdlib -B ../tcc-bootstrap -I ../musl-final/include tcc.c ../musl-final/lib/*.[oa] -o out/tcc)
)

# (
#   cd 06;
#   export NPROC=$(nproc --all)
#   cp ../05/tcc-final/out/tcc tcc-seed

#   # Create a stage directory
#   mkdir -p stage

#   # Download all the required source files
#   ash ./helpers/download.sh

#   # Inject initial tcc and our scripts; pre-unpack and patch stage 1 sources,
#   # in a separate file because it makes sense to run it separately sometimes.
#   ash ./helpers/seed.sh
# )
