":::::::::::::::::::  STARTUP :::::::::::::::::::
" quit when a syntax file was already loaded.
if exists("b:current_syntax")
  finish
endif

" We need nocompatible mode in order to continue lines with backslashes.
" Original setting will be restored.
let s:cpo_save = &cpo
set cpo&vim



":::::::::::::::::::  OTHER :::::::::::::::::::
" sync at the beginning of class, function, or method definition.
syn sync match pythonSync grouphere NONE "^\%(def\|class\)\s\+\h\w*\s*[(:]"
" trailing whitespace
syn match   pythonSpaceError	display excludenl "\s\+$"
" mixed tabs and spaces
syn match   pythonSpaceError	display " \+\t"
syn match   pythonSpaceError	display "\t\+ "


":::::::::::::::::::  STRINGS :::::::::::::::::::
syn keyword pythonTodo		FIXME NOTE NOTES TODO XXX contained
syn match   pythonFunction	"\h\w*" display contained
syn match   pythonComment	"#.*$" contains=pythonTodo,@Spell
syn match   pythonDecorator	"@" display contained
syn match   pythonDecoratorName	"@\s*\h\%(\w\|\.\)*" display contains=pythonDecorator
syn match   pythonEscape	+\\[abfnrtv'"\\]+ contained
syn match   pythonEscape	"\\\o\{1,3}" contained
syn match   pythonEscape	"\\x\x\{2}" contained
syn match   pythonEscape	"\%(\\u\x\{4}\|\\U\x\{8}\)" contained
syn match   pythonEscape	"\\N{\a\+\%(\s\a\+\)*}" contained
syn match   pythonEscape	"\\$"

syn region  pythonString matchgroup=pythonQuotes
      \ start=+[uU]\=\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
      \ contains=pythonEscape,@Spell
syn region  pythonStringTripleQuotes matchgroup=pythonTripleQuotes
      \ start=+[uU]\=\z('''\|"""\)+ end="\z1" keepend
      \ contains=pythonEscape,pythonSpaceError,@Spell
syn region  pythonRawString matchgroup=pythonQuotes
      \ start=+[uU]\=[rR]\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
      \ contains=@Spell
syn region  pythonRawString matchgroup=pythonTripleQuotes
      \ start=+[uU]\=[rR]\z('''\|"""\)+ end="\z1" keepend
      \ contains=pythonSpaceError,@Spell


"::::::::::::::::::: NUMERIC :::::::::::::::::::
syn match   pythonOperator	"[\[\]\-\+\/\*\(\)\,\.\=\%]"
syn match   pythonNumber	"\<0[oO]\=\o\+[Ll]\=\>"
syn match   pythonNumber	"\<0[xX]\x\+[Ll]\=\>"
syn match   pythonNumber	"\<0[bB][01]\+[Ll]\=\>"
syn match   pythonNumber	"\<\%([1-9]\d*\|0\)[Ll]\=\>"
syn match   pythonNumber	"\<\d\+[jJ]\>"
syn match   pythonNumber	"\<\d\+[eE][+-]\=\d\+[jJ]\=\>"
syn match   pythonNumber	"\<\d\+\.\%([eE][+-]\=\d\+\)\=[jJ]\=\%(\W\|$\)\@="
syn match   pythonNumber        "\%(^\|\W\)\zs\d*\.\d\+\%([eE][+-]\=\d\+\)\=[jJ]\=\>"
syn match   pythonMatrixMultiply
      \ "\%(\w\|[])]\)\s*@"
      \ contains=ALLBUT,pythonDecoratorName,pythonDecorator,pythonFunction
      \ transparent
" Multiplication continued on the next line after backslash.
syn match   pythonMatrixMultiply
      \ "[^\\]\\\s*\n\%(\s*\.\.\.\s\)\=\s\+@"
      \ contains=ALLBUT,pythonDecoratorName,pythonDecorator,pythonFunction
      \ transparent
" Multiplication in a parenthesized expression over multiple lines with @ at
" the start of each continued line; very similar to decorators and complex.
syn match   pythonMatrixMultiply
      \ "^\s*\%(\%(>>>\|\.\.\.\)\s\+\)\=\zs\%(\h\|\%(\h\|[[(]\).\{-}\%(\w\|[])]\)\)\s*\n\%(\s*\.\.\.\s\)\=\s\+@\%(.\{-}\n\%(\s*\.\.\.\s\)\=\s\+@\)*"
      \ contains=ALLBUT,pythonDecoratorName,pythonDecorator,pythonFunction
      \ transparent


":::::::::::::::::::  BUILTINS :::::::::::::::::::
syn keyword pythonStatement	as assert break continue del global and in is not or lambda nonlocal 
syn keyword pythonStatement	apass return with yield elif else if for while except finally raise try
syn keyword pythonInclude	from import
syn keyword pythonAsync		async await
syn keyword pythonBuiltin	class def nextgroup=pythonFunction skipwhite
syn keyword pythonConstant      False True None
syn keyword pythonBuiltin	NotImplemented Ellipsis __debug__
syn keyword pythonBuiltin	quit exit copyright credits license
syn keyword pythonBuiltin	abs all any ascii bin bool breakpoint bytearray
syn keyword pythonBuiltin	bytes callable chr classmethod compile complex
syn keyword pythonBuiltin	delattr dict dir divmod enumerate eval exec
syn keyword pythonBuiltin	filter float format frozenset getattr globals
syn keyword pythonBuiltin	hasattr hash help hex id input int isinstance
syn keyword pythonBuiltin	issubclass iter len list locals map max
syn keyword pythonBuiltin	memoryview min next object oct open ord pow
syn keyword pythonBuiltin	print property range repr reversed round set
syn keyword pythonBuiltin	setattr slice sorted staticmethod str sum super
syn keyword pythonBuiltin	tuple type vars zip __import__
" avoid highlighting attributes as builtins
syn match   pythonAttribute	/\.\h\w*/hs=s+1
      \ contains=ALLBUT,pythonBuiltin,pythonFunction,pythonAsync
      \ transparent


":::::::::::::::::::  EXCEPTIONS :::::::::::::::::::
syn keyword pythonExceptions	BaseException Exception
syn keyword pythonExceptions	ArithmeticError BufferError LookupError
syn keyword pythonExceptions	AssertionError AttributeError EOFError
syn keyword pythonExceptions	FloatingPointError GeneratorExit ImportError
syn keyword pythonExceptions	IndentationError IndexError KeyError
syn keyword pythonExceptions	KeyboardInterrupt MemoryError
syn keyword pythonExceptions	ModuleNotFoundError NameError
syn keyword pythonExceptions	NotImplementedError OSError OverflowError
syn keyword pythonExceptions	RecursionError ReferenceError RuntimeError
syn keyword pythonExceptions	StopAsyncIteration StopIteration SyntaxError
syn keyword pythonExceptions	SystemError SystemExit TabError TypeError
syn keyword pythonExceptions	UnboundLocalError UnicodeDecodeError
syn keyword pythonExceptions	UnicodeEncodeError UnicodeError
syn keyword pythonExceptions	UnicodeTranslateError ValueError
syn keyword pythonExceptions	ZeroDivisionError
syn keyword pythonExceptions	EnvironmentError IOError WindowsError
syn keyword pythonExceptions	BlockingIOError BrokenPipeError
syn keyword pythonExceptions	ChildProcessError ConnectionAbortedError
syn keyword pythonExceptions	ConnectionError ConnectionRefusedError
syn keyword pythonExceptions	ConnectionResetError FileExistsError
syn keyword pythonExceptions	FileNotFoundError InterruptedError
syn keyword pythonExceptions	IsADirectoryError NotADirectoryError
syn keyword pythonExceptions	PermissionError ProcessLookupError TimeoutError
syn keyword pythonExceptions	BytesWarning DeprecationWarning FutureWarning
syn keyword pythonExceptions	ImportWarning PendingDeprecationWarning
syn keyword pythonExceptions	ResourceWarning RuntimeWarning
syn keyword pythonExceptions	SyntaxWarning UnicodeWarning
syn keyword pythonExceptions	UserWarning Warning


":::::::::::::::::::  HIGHLIGHTING DEFAULTS :::::::::::::::::::
hi def link pythonComment		Comment   " any comment
hi def link pythonStringTripleQuotes	Comment   " any comment
hi def link pythonTripleQuotes		Comment
hi def link pythonConstant		Constant  " any constant
hi def link pythonDecorator		Function  " function name and method for classes
hi def link pythonDecoratorName		Function  
hi def link pythonFunction		Function  
hi def link pythonExceptions		Exception " try, catch, throw
hi def link pythonInclude		Include   " #include or import
hi def link pythonBuiltin		Keyword	
hi def link pythonNumber		Number    " 234, 0xff
hi def link pythonOperator		Operator  " + * etc.
hi def link pythonEscape		Special   " any special symbol
hi def link pythonStatement		Statement " any statement 
hi def link pythonAsync			Statement
hi def link pythonString		String    " string constant
hi def link pythonRawString		String
hi def link pythonQuotes		String
hi def link pythonTodo			Todo      " keywords TODO etc.

let b:current_syntax = "python"

let &cpo = s:cpo_save
unlet s:cpo_save

" vim:set sw=2 sts=2 ts=8 noet:
