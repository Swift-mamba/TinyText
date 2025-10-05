--[[	THE SOURCE CODE TO TINYTYPE IS SELF CONTAINED IN THIS ONE FILE, ADVENTURERS BEWARE!	]]--
---█████████████████████████---
---█  MISC FEATURES BLOCK  █---
---█████████████████████████---
HELP = {
Commands = [[
Commands Help:
> Commands are prefixed using '$'
> Commands can only be used in idle mode
Commands List:
> $UP       : Moves the selected line in the file upwards.
> $DOWN     : Moves the selected line in the file downwards.
> $INSERT   : Changes mode to insert mode, See footnote 1.
> $DELETE   : Deletes a whole line from a file.
> $LANGUAGE : Selects syntax highlighting to use.
> $CONFIG   : Handles editor configs.
Footnotes:
[1] To escape insert mode, type ^[ESC]
[2] Syntax highlighting only works for included languages. check the UDEFINEDLANAG block in the source code.
]],
}

---█████████████████---
---█  CONUI BLOCK  █---
---█████████████████---
CONUI = {}
function CONUI.GetConsole()
	local console = io.popen("mode con", "r")
	consolelist = {}
	if console then
		for line in console:lines() do
			table.insert(consolelist,#consolelist+1,line)
		end
		console:close()
	end
	CON_LINES = tonumber(string.sub(consolelist[4], #consolelist[4] - 1, #consolelist[4]))
	CON_COLUMNS = tonumber(string.sub(consolelist[5], #consolelist[5] - 2, #consolelist[5]))
	return({CON_LINES,CON_COLUMNS})
end
function CONUI.FormatConsole()
	os.execute("@ECHO off")
	os.execute("chcp 65001")
	os.execute("cls")
end
---████████████████████████████████---
---█  SYNTAX HIGHLIGHTING CONFIG  █---
---████████████████████████████████---
SYNTAXCFG = {
	enabled = true,
	languages = {"test"},
	themes = {
		-- I USED UNLISCENED MONOKAI, SOMEBODY STOP ME!!!
		default = {
			default = "8b:255",
			keywords = "8b:205",
			numbers = "8b:93",
			comments = "8b:250",
			strings = "8b:229",
			additional = "8b:69",
			helperfunc = "8b:113",
			misc = "8b:215",
			bg = "8b:236",
			fg = "8b:15",
		}
		
	}
}
