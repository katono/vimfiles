" Vim syntax file
" Language:     Motorola S-record format
" Maintainer:   KATO Noriaki <katono123@gmail.com>
" Last Change:  2011/01/12

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

let s:addr_type = "1"
let s:data_start_line = 0
let s:data_end_line = line("$") + 1
let s:i = 1
while s:i < s:data_end_line
	let s:type = getline(s:i)[1]
	if s:type == "1" || s:type == "2" || s:type == "3"
		let s:addr_type = s:type
		let s:data_start_line = s:i - 1
		break
	endif
	let s:i = s:i + 1
endwhile

syn match motType	"^S\d"
syn match motLen	"\%>2c\x\%<6c"

let s:s0_end_line = s:data_start_line + 1
exe 'syn match motAddr0	"\%<' . s:s0_end_line . 'l\%>4c\x\%<10c"'

if s:addr_type == "1"
	let s:end = "10"
elseif s:addr_type == "2"
	let s:end = "12"
else
	let s:end = "14"
endif
exe 'syn match motAddr' . s:addr_type . ' "\%>' . s:data_start_line . 'l\%<' . s:data_end_line . 'l\%>4c\x\%<' . s:end . 'c"'

syn match motSum	"\x\x$"

command -nargs=+ HiLink hi def link <args>
HiLink motType	Type
HiLink motLen	Constant
HiLink motAddr0	Underlined
HiLink motAddr1	Underlined
HiLink motAddr2	Underlined
HiLink motAddr3	Underlined
HiLink motSum	PreProc
delcommand HiLink

let b:current_syntax = "mot"
