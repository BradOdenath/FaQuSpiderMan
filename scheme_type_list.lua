wate = function() pcall(function() wait() end) end

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
	
	--- TODO: https://data.iana.org/TLD/tlds-alpha-by-domain.txt
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
print_all_possible_urls = function(ayo)
	for i,v in pairs(url.schemes()) do		
		for j,w in pairs(alphabet.letters()) do
			_ayo = (((ayo)~=nil) and (ayo) or (w))
			for k,x in pairs(url.tld()) do
				_url = (v.._ayo..x)
				--print(print_all_possible_urls)
				print_all_possible_urls(_ayo)
				print(_url)
				wate()
end	end end end
--print(print_all_possible_urls)
--print_all_possible_urls()


print_table = function(tbl)
	comma, commaify = false, function(...) comma = true return (...) end
	out = ('{ ')
	for i,v in pairs(tbl) do
		out = (comma and (out..(', '..(v))) or commaify(out..(v)))
	end
	out = (out..(' }'))
	print(out)
end

print_table(alphabet.letters())