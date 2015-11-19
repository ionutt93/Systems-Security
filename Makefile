mem_rand_off:
	sysctl -w kernel.randomize_va_space=0

mem_rand_on:
	/sbin/sysctl -w kernel.randomize_va_space=2

run_exploit:
	gcc -o exploit exploit.c
	./exploit

debug_exploig:
	gcc -g -o dexploit exploit.c

initial_setup:
	gcc -g -z execstack -fno-stack-protector -o stack stack.c
	cp stack rstack
	touch badfile
	chown root rstack
	chmod +s rstack

no_exec_setup:
	gcc -g -o stack -fno-stack-protector -z noexecstack stack.c
	cp stack rstack
	touch badfile
	chown root rstack
	chmod +s rstack

repeat_exploit:
	 sh -c "while [ 1 ]; do ./rstack; ./exploit; done;"

clean:
	rm core
	rm stack
	rm rstack
	rm exploit