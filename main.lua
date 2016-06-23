--package.cpath = package.cpath .. ";*.a";
local co = nil;
local mylib = require("mylib");

local function cofunc()
	for i = 1,10 do
		print(i);
		if (i < 10) then
			coroutine.yield();
		end
	end
	local file = io.open("txt","r");
	print(file:read("*all"));
	co = nil
end

function run()
	print("lua runing..");
	if (nil == co) then
		co = coroutine.create(cofunc);
	end
	print(mylib.add(5200000,1314));
	coroutine.resume(co);
end