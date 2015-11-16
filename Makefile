mem_rand_off:
	sysctl -w kernel.randomize_va_space=0

mem_rand_on:
	/sbin/sysctl -w kernel.randomize_va_space=2

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