local groups = {
	{char = "\"", cchar="\"", string=true},
	{char = "\'", cchar="\'", string=true},
	{char = "(", cchar=")"},
	{char = "[", cchar = "]"},
	{char = "<", cchar = ">"},
	{char = "{", cchar = "}"},
}

local escapes = {
	["n"] = "\n",
	["r"] = "\r",
	["'"] = "'",
	["\""] = "\"",
	["\\"] = "\\"
}
local function checkparentheses(str)
	local escaped = false
	local strcap = false
	local pos = 1
	local matches = {}
	local smatches = {}
	local opengroups = {}
	local strstart = -1
	while true do
		local curchar = str:sub(pos, pos)
		if (curchar == "") then
			break
		end
		if not strcap then
			for i=1, #groups do
				if (curchar == groups[i].char) then
					if (groups[i].string) then
						strcap = true
						matches[#matches+1] = {cchar = groups[i].cchar, val = ""}
						strstart = pos
					else
						opengroups[#opengroups+1] = {start = pos, groupdat = groups[i]}
					end
					break
				elseif (curchar == groups[i].cchar) then
					local close = false
					for x=#opengroups, 1, -1 do
						if (opengroups[x].groupdat.cchar == curchar) then
							table.remove(opengroups, x)
							close = true
							break
						end
					end
					if (not close) then
						return nil, "Unmatched grouping character '"..curchar.."' at character "..pos
					end
				end
			end
		else
			if (escaped) then
				local appchar = escapes[curchar]
				if not appchar then
					return nil, "Error on character "..pos..", invalid escape sequence '\\"..curchar.."'"
				end
				escaped = false
				matches[#matches].val = matches[#matches].val .. appchar
			else
				if (curchar == "\\") then
					escaped = true
				elseif (curchar == matches[#matches].cchar) then
					strcap = false
					smatches[#smatches+1] = matches[#matches].val
				else
					matches[#matches].val = matches[#matches].val .. curchar
				end
			end
		end
		pos = pos + 1
	end
	if (strcap) then
		return nil, "Unclosed string, starting at character "..strstart
	elseif (#opengroups == 1) then
		return nil, "Unclosed group, starting at character "..opengroups[1].start
	elseif (#opengroups ~= 0) then
		local rtnstr = "Multiple unclosed groups at positions "
		for i=1, #opengroups do
			rtnstr = rtnstr .. opengroups[i].start .. ", "
		end
		rtnstr = rtnstr:sub(1, -3)
		return nil, rtnstr
	end
	return smatches
end

local function test(str)
	local dat, err = checkparentheses(str)
	print("-------------------")
	print("TEST: "..str)
	print("Syntax check: "..((dat and "Passing!") or "Failed ("..err..")"))
	if (dat) then
		for i=1, #dat do
			print(dat[i])
		end
	end
	print("-------------------")
	print("")
end

test("")
test("Hello world!")
test("(")
test(")")
test("()")
test("())")
test("(Hello world!)")
test("(()(()(())))")
test("(((()()(())))")
test("\"testing 123\"")
test(")(")
test("<>")
test("><")
test("<<<>>><><<<>><>>")
test("{}")
test("}{")
test("{{{{}}{{}}}}")
test("[]")
test("][")
test("\'testing. it\\'s all good, rite?\'")
test("\'this should fail\"")
