all : mylib.so test

mylib.so : lib.cpp
	g++ lib.cpp -fPIC -shared -llua -o mylib.so -DLUA_LIB -DLUA_BUILD_AS_DLL

test : luatest.cpp
	g++ -o test luatest.cpp -llua -ldl -lm -Wl -E