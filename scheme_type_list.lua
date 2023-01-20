alphabet = {
	range = {
		low = 97,
		high = 122
	},
	letters = function()
		ltrs = {}
		for i = alphabet.range.low, alphabet.range.high do
			table.insert(ltrs,string.char(i))
		end
		return ltrs
	end
}

url = {
	_schemes = {"http","https"},
	
	slash = '/',
	dot = '.',
	
	_tld = {
		'com',
		'net',
		'org',
		'me',
		'io',
	},
	
	schemes = function()
		__schemes = {}
		for i,v in pairs(url._schemes) do
			table.insert(__schemes,(v..(url.colonslashslash)))
		end
		return (__schemes)
	end,
	
	tld = function()
		__tld = {}
		for i,v in pairs(url._tld) do
			table.insert(__tld,url.dot..(v))
		end
		return (__tld)
	end
	
}
url.colonslashslash = (":"..url.slash..url.slash)
url.print_all_possible_urls = function(ayo)
	for i,v in pairs(url.schemes()) do		
		for j,w in pairs(alphabet.letters()) do
			for k,x in pairs(url.tld()) do
				_ayo = (((ayo)~=nil) and (ayo) or '')
				_url = (v..w.._ayo..x)
				url.print_all_possible_urls(_ayo..w)
				print(_url)
end	end end end
url.print_all_possible_urls()


print_table = function(tbl)
	comma = false
	out = ('{ ')
	for i,v in pairs(tbl) do
		out = (comma and (out..', '..v) or (out..(v)))
		if (not comma) then comma = true end
	end
	out = (out..' }')
	print(out)
end

print_table(alphabet.letters())