all:
	fpc -B -Cg -CfSSE64 -CX -XX -O4 cachizh.pas
	-sstrip cachizh
	-upx cachizh
	-sstrip cachizh
	-rm -f *.o

clean:
	rm -f *.o *.ppu cachizh