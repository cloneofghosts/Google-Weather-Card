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

function GetIcons(currCode, currPod)
	local code
	if currCode == 800 and currPod == "n" then
		code = 805
	elseif currCode == 801 and currPod == "n" then
		code = 806
	elseif currCode == 802 and currPod == "n" then
		code = 807
	elseif currCode == 803 and currPod == "n" then
		code = 808
	elseif currCode == "900" then
		code = 900
	else
		code = currCode
	end
	return code
end

function WindConversion(windSpd, conversion)
	local speed = 0
	speed = windSpd * conversion
	return math.floor(speed+0.5)
end