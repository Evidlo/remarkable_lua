# Evan Widloski - 2019-10-25
# makefile for building/testing python packages

# run all lines in target in single shell, quit on error
.ONESHELL:
.SHELLFLAGS = -ec

LUA_MAIN=main.lua

LUA_VERSION=5.3.5
CC=arm-linux-gnueabihf-gcc

# build the main lua file
main: luastatic lua-${LUA_VERSION}/src/liblua.a
	CC=${CC} luastatic/luastatic.lua \
		${LUA_MAIN} \
		lua-${LUA_VERSION}/src/liblua.a \
		-Ilua-${LUA_VERSION}/src
		# -static

# build Lua shared library
lua-${LUA_VERSION}/src/liblua.a: lua-${LUA_VERSION}
	cd lua-${LUA_VERSION}
	make CC=${CC} posix

# retrieve Lua source
lua-${LUA_VERSION}:
	wget http://www.lua.org/ftp/lua-${LUA_VERSION}.tar.gz
	tar xvf lua-${LUA_VERSION}.tar.gz
	rm lua-${LUA_VERSION}.tar.gz

# retrieve Luastatic
luastatic:
	git clone https://github.com/ers35/luastatic
	cd luastatic
	# pin version
	git checkout 261d355

# cleanup built files
clean:
	rm -f $(basename ${LUA_MAIN} .lua)
	rm -f ${LUA_MAIN}.c

# reset everything
clean-all: clean
	make -C lua-${LUA_VERSION} clean
