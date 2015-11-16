mem_rand:
	sysctl -w kernel.randomize_va_space=0

run_exploit:
	gcc -o exploit exploit.c
	./exploit

initial_setup:
	gcc -g -z execstack -fno-stack-protector -o stack stack.c
	cp stack rstack
	touch badfile
	chown root rstack
	chmod +s rstack

clean:
	rm core
	rm stack
	rm rstack
	rm exploit