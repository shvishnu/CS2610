nasm -f elf CS19B045_1.asm
ld -m elf_i386 -s CS19B045_1.o io.o -o CS19B045_1
