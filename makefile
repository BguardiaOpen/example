INCLUDE_DIR_PARSER=../sql-parser/src 
INCLUDE_DIR_STORAGE=../dbstorage
LIB_DIR=/lib/x86_64-linux-gnu

OBJS =  examplemain.o ParseTreeToString.o

#all: $(OBJS)

example: $(OBJS)
	g++ -L$(LIB_DIR) -L$(HOME)/lib $(OBJS) -ldbstorage -lsqlparser2 -o $@

examplemain.o: examplemain.cpp
	g++ -I$(INCLUDE_DIR_PARSER) -I$(INCLUDE_DIR_STORAGE) -std=c++11 -std=c++0x -Wall -Wno-c++11-compat -DHAVE_CXX_STDHEADERS -D_GNU_SOURCE -D_REENTRANT -O3 -c -ggdb -o "$@" "$<" 

# General rule for compilation
%.o: %.cpp *.h
	g++ -I$(INCLUDE_DIR_PARSER) -std=c++11 -std=c++0x -Wall -Wno-c++11-compat -DHAVE_CXX_STDHEADERS -D_GNU_SOURCE -D_REENTRANT -O3 -c -ggdb -o "$@" "$<" 

clean:
	rm -f example *.o
