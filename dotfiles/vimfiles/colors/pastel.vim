scriptencoding utf-8

set background=dark
hi clear

if exists("syntax_on")
    syntax reset
endif

let g:colors_name="pastel"


function!  GuiColor(group, ...)
  let histring = 'hi ' . a:group . ' '

  if strlen(a:1)
    let histring .= 'guifg=' . a:1 . ' '
  endif

  if strlen(a:2)
    let histring .= 'guibg=' . a:2 . ' '
  endif

  execute histring
endfunction


let cdDarkGray = "#343434"
let cdLightGray = "#D4D4D4"
let cdGray = "#585858"
let cdPastelRed = "#ff6961"
let cdPastelPink = "#ffbb9e"
let cdPastelYellow = "#fdfd96"
let cdPastelGreen = "#9fe58e"
let cdPastelBlue = "#9ee2ff"
let cdPastelBlueDark = "#779ecb"
let cdPastelPurple = "#C3B1E1"

let cdRef1 = cdPastelPink
let cdRef2 = cdPastelGreen
let cdRef3 = cdPastelPurple
let cdRef4 = cdPastelBlue
let cdRef5 = cdPastelYellow
let cdRef6 = cdPastelRed

call GuiColor("Normal",     cdRef4,   cdDarkGray)
call GuiColor("LineNr",     cdGray,    "NONE")
call GuiColor("CursorLine", "NONE",    "NONE")
call GuiColor("Operator",   cdLightGray,    "NONE")
call GuiColor("Todo",       cdRef1,   "NONE")
call GuiColor("Number",     cdRef1,   "NONE")
call GuiColor("Float",      cdRef1,   "NONE")
call GuiColor("Exception",  cdRef1,   "NONE")
call GuiColor("Function",   cdRef1,   "NONE")
call GuiColor("Comment",    cdRef2,  "NONE")
call GuiColor("String",     cdRef2,  "NONE")
call GuiColor("Character",  cdRef2,  "NONE")
call GuiColor("Special",    cdRef2,  "NONE")
call GuiColor("Keyword",    cdRef3, "NONE")
call GuiColor("Statement",  cdRef3, "NONE")
call GuiColor("Include",    cdRef3, "NONE")
call GuiColor("Conditional",cdRef3, "NONE")
call GuiColor("Exception",  cdRef3, "NONE")
call GuiColor("Constant",  cdRef3, "NONE")
call GuiColor("PreProc",  cdRef5, "NONE")
call GuiColor("PreCondit",  cdRef5, "NONE")
call GuiColor("Define",  cdRef5, "NONE")
call GuiColor("Macro",  cdRef5, "NONE")
call GuiColor("Search", "NONE", cdRef5)
call GuiColor("Type",  cdRef6, "NONE")
call GuiColor("StorageClass",  cdRef6, "NONE")
call GuiColor("Structure",  cdRef6, "NONE")
call GuiColor("Typedef",  cdRef6, "NONE")

"call GuiColor("Cursor",  cdRef5, "NONE")
"call <sid>hi('ColorColumn', {}, s:cdCursorDarkDark, 'none', {})
"call <sid>hi('CursorColumn', {}, s:cdCursorDarkDark, 'none', {})
"call <sid>hi('Directory', s:cdBlue, s:cdDarkGrey, 'none', {})
"call <sid>hi('DiffAdd', {}, s:cdDiffGreenLight, 'none', {})
"call <sid>hi('DiffChange', {}, s:cdDiffRedDark, 'none', {})
"call <sid>hi('DiffDelete', {}, s:cdDiffRedLight, 'none', {})
"call <sid>hi('DiffText', {}, s:cdDiffRedLight, 'none', {})
"call <sid>hi('EndOfBuffer', s:cdLineNumber, s:cdDarkGrey, 'none', {})
"call <sid>hi('ErrorMsg', s:cdRed, s:cdDarkGrey, 'none', {})
"call <sid>hi('VertSplit', s:cdSplitDark, s:cdDarkGrey, 'none', {})
"call <sid>hi('Folded', s:cdLeftLight, s:cdLeftDark, 'underline', {})
"call <sid>hi('FoldColumn', s:cdLineNumber, s:cdDarkGrey, 'none', {})
"call <sid>hi('SignColumn', {}, s:cdDarkGrey, 'none', {})
"call <sid>hi('IncSearch', s:cdNone, s:cdSearchCurrent, 'none', {})
"call <sid>hi('LineNr', s:cdLineNumber, s:cdDarkGrey, 'none', {})
"call <sid>hi('CursorLineNr', s:cdPopupFront, s:cdDarkGrey, 'none', {})
"call <sid>hi('MatchParen', s:cdNone, s:cdCursorDark, 'none', {})
"call <sid>hi('ModeMsg', s:cdLightGrey, s:cdLeftDark, 'none', {})
"call <sid>hi('MoreMsg', s:cdLightGrey, s:cdLeftDark, 'none', {})
"call <sid>hi('NonText', s:cdLineNumber, s:cdDarkGrey, 'none', {})
"call <sid>hi('Pmenu', s:cdPopupFront, s:cdPopupBack, 'none', {})
"call <sid>hi('PmenuSel', s:cdPopupFront, s:cdPopupHighlightBlue, 'none', {})
"call <sid>hi('PmenuSbar', {}, s:cdPopupHighlightGray, 'none', {})
"call <sid>hi('PmenuThumb', {}, s:cdPopupFront, 'none', {})
"call <sid>hi('Question', s:cdBlue, s:cdDarkGrey, 'none', {})
"call <sid>hi('SpecialKey', s:cdBlue, s:cdNone, 'none', {})
"call <sid>hi('StatusLine', s:cdLightGrey, s:cdLeftMid, 'none', {})
"call <sid>hi('StatusLineNC', s:cdLightGrey, s:cdLeftDark, 'none', {})
"call <sid>hi('TabLine', s:cdLightGrey, s:cdTabOther, 'none', {})
"call <sid>hi('TabLineFill', s:cdLightGrey, s:cdTabOutside, 'none', {})
"call <sid>hi('TabLineSel', s:cdLightGrey, s:cdTabCurrent, 'none', {})
"call <sid>hi('Title', s:cdNone, s:cdNone, 'bold', {})
"call <sid>hi('Visual', s:cdNone, s:cdSelection, 'none', {})
"call <sid>hi('VisualNOS', s:cdNone, s:cdSelection, 'none', {})
"call <sid>hi('WarningMsg', s:cdOrange, s:cdDarkGrey, 'none', {})
"call <sid>hi('WildMenu', s:cdNone, s:cdSelection, 'none', {})



