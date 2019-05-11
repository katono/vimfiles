if exists("loaded_csv")
    finish
endif
let loaded_csv = 1

function s:IsDoubleQuotation()
	normal yl
	if @0 == '"'
		return 1
	else
		return 0
	endif
endfunction

function s:Csv()
	normal G
	let l:line = line("$")
	let l:col = col("$") - 1
	normal gg
	let l:quote_flag = 0
	while 1
		if s:IsDoubleQuotation()
			if l:quote_flag
				let l:quote_flag = 0
			else
				let l:quote_flag = 1
			endif
		else
			if l:quote_flag && @0 == ','
				normal r
			endif
		endif
		let l:i = line(".")
		let l:j = col(".")
		if l:i == l:line && l:j == l:col
			break
		endif
		normal l
	endwhile
	echo "Align"
	%Align ,
	silent! %s//,/g
	set nowrap
	set go+=b
endfunction

function s:UnCsv()
	normal G
	let l:line = line("$")
	let l:col = col("$") - 1
	normal gg
	let l:quote_flag = 0
	while 1
		if s:IsDoubleQuotation()
			if l:quote_flag
				let l:quote_flag = 0
			else
				let l:quote_flag = 1
			endif
		else
			if l:quote_flag && @0 == ' '
				normal r
			endif
		endif
		let l:i = line(".")
		let l:j = col(".")
		if l:i == l:line && l:j == l:col
			break
		endif
		normal l
	endwhile
	silent! %s/ *, */,/g
	silent! %s// /g
endfunction

command Csv call s:Csv()
command UnCsv call s:UnCsv()
