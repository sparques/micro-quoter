VERSION = "1.1.0"

local micro = import("micro")
local config = import("micro/config")

-- TODO: auto-indent when {} are used?

function preinit()
	config.RegisterCommonOption("quoter", "enable", true)
	config.RegisterCommonOption("quoter", "mode", "default")
end

function init()
	config.AddRuntimeFile("quoter", config.RTHelp, "help/quoter.md")
end

function preRune(bp, r)
	if bp.Buf.Settings["quoter.enable"] == false  then
		return true
	end
	if bp.Cursor:HasSelection() == false then
		return true
	end
	
	-- try using user settings, or use "default"
	local mode = bp.Buf.Settings["quoter.mode"]
	local quotePairs = modes[mode]

	if not quotePairs then
		micro.InfoBar():Error("Unknown quoter mode: \"" .. mode .. "\". Appliying mode \"default\".")
		-- config.SetGlobalOption("quoter.mode", "default")
		mode = "default"
		quotePairs = modes["default"]
	end
	
	for i = 1, #quotePairs do
		if r == quotePairs[i][1] or r == quotePairs[i][2] then
			quote(bp, quotePairs[i][1], quotePairs[i][2])
			return false
		end
	end
end

function quote(bp, open, close)
	if not (-bp.Cursor.CurSelection[1]):GreaterThan(-bp.Cursor.CurSelection[2]) then -- is the first selection point later in the document than the second?
		bp.Buf:Insert(-bp.Cursor.CurSelection[1], open)  -- right order
		bp.Buf:Insert(-bp.Cursor.CurSelection[2], close) -- this happens almost always
		bp.Cursor.CurSelection[2].X = bp.Cursor.CurSelection[2].X - 1
	else
		bp.Buf:Insert(-bp.Cursor.CurSelection[2], open)  -- backwards to make sure the brackets aren't )like this(
		bp.Buf:Insert(-bp.Cursor.CurSelection[1], close) -- this only happens if the user selects text backwards with a mouse
		bp.Cursor.CurSelection[1].X = bp.Cursor.CurSelection[1].X - 1
	end
end
