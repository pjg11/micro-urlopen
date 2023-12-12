VERSION = "0.0.0"

local micro = import("micro")
local config = import("micro/config")
local shell = import("micro/shell")

function init()
	config.MakeCommand("urlopen", urlopen, config.NoComplete)
	config.TryBindKey("Alt-o", "command:urlopen", true)
end

function urlopen(bp)
	local c = bp.Cursor
	local buf = bp.Buf
	local line = buf:Line(c.Y)

	local start, stop = string.find(line, "https?://[^ )>]+")
	if start then
		local result = string.sub(line,start,stop)
		if (c.X >= start - 1) and (c.X <= stop - 1) then
			shell.JobSpawn("open", {result}, nil, renameStderr, renameExit, bp)
		else
			micro.InfoBar():Message("Not a link")
		end
	else
		micro.InfoBar():Message("Not a link")
	end
end

function renameStderr(err)
    micro.Log(err)
    micro.InfoBar():Message(err)
end

function renameExit(output, args)
    local bp = args[1]
    bp.Buf:ReOpen()
end
