url = {
	schemes = {"http","https"},
	
	colonslashslash = "://",
	dot = '.',
	
	tld = {
		'com',
		'net',
		'org',
		'me',
		'io',
	}
	
}

alphabet = {
	range = {
		low = 97,
		high = 122
	}
}

url.protocols = function()
	schemes = {}
	for i,v in pairs(url.schemes) do
		table.insert(schemes,(v..url.colonslashslash))
	end
	return (schemes)
end

alphabet.letters = function()
	ltrs = {}
	for i = alphabet.range.low, alphabet.range.high do
		table.insert(ltrs,string.char(i))
	end
	return ltrs
end

print_table = function(tbl)
	comma = false
	out = ('{ ')
	for i,v in pairs(tbl) do
		out = (comma and (out..', '..v) or (out..v))
		if (not comma) then comma = true end
	end
	out = (out..' }')
	print(out)
end
print_table(alphabet.letters())