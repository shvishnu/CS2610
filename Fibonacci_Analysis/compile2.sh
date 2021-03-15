nasm -f elf CS19B045_2.asm
ld -m elf_i386 -s CS19B045_2.o io.o -o CS19B045_2
