function Initalize()
end


function GetDay(dayTime)
	local Day =  os.date("%A", dayTime)
	return Day
end

function GetTime(currTime)
	local Hour, Minute, AMPM =  os.date("%I", currTime), os.date("%M", currTime), os.date("%p", currTime)
	return Hour..':'..Minute.. ' ' ..AMPM
end

function GetIcon(CurrentCode, IsDay)
	local icon
	local daytime
	if IsDay == 1 then
		daytime = "_d"
	else
		daytime = "_n"
	end
	if CurrentCode == 1000 or CurrentCode == 1003 or CurrentCode == 1006 or CurrentCode == 1063 or CurrentCode == 1066 or CurrentCode == 1069 or CurrentCode == 1087 or CurrentCode == 1150 or CurrentCode == 1180 or CurrentCode == 1210 or CurrentCode == 1216 or CurrentCode == 1222 then
		icon = CurrentCode .. daytime
	else
		icon = CurrentCode
	end
	return icon
end