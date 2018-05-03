CXX = g++
CFLAGS = -O1 -Wall -g
SRCS = matadd.s matadd-driver.o
BIN = matadd

all:
	$(CXX) $(CFLAGS) -o $(BIN) $(SRCS)

unroll2 :
	$(CXX) $(CFLAGS) -o $(BIN) matadd-unrolled2.s matadd-driver.o

unroll4 :
	$(CXX) $(CFLAGS) -o $(BIN) matadd-unrolled4.s matadd-driver.o

unroll8 :
	$(CXX) $(CFLAGS) -o $(BIN) matadd-unrolled8.s matadd-driver.o

ssh : 
	ssh tnewma03@unix4.csc.calpoly.edu

scpfull :
	scp *.s tnewma03@unix4.csc.calpoly.edu:~/cpe315/lab4
	scp matadd-driver.o tnewma03@unix4.csc.calpoly.edu:~/cpe315/lab4
	scp Makefile tnewma03@unix4.csc.calpoly.edu:~/cpe315/lab4

scpmain :
	scp matadd.s tnewma03@unix4.csc.calpoly.edu:~/cpe315/lab4

pi :
	ssh 129.65.128.77

run :
	./matadd > myoutput.gold

perf :
	perf stat ./matadd > myoutput.gold

clean:
	rm -f $(BIN)
