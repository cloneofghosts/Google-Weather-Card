function Initalize()
end


function GetDay(dayTime)
	day = 0
	formatPattern = '^(%d%d%d%d)%-(%d%d)%-(%d%d)[Tt](%d%d%.?%d*):(%d%d):(%d%d)()'
	year, month, day, hour, min = dayTime:match(formatPattern)
	thenStamp = os.time({year=year, month=month, day=day, hour=hour})
	local zone = os.date('%z')
	local signum, hours, minutes = zone:match '([+-])(%d%d)(%d%d)'
	local dt = (tonumber(hours)*3600 + tonumber(signum..minutes)*60)
	local offset = "-" and -1 or 1
	thenStamp = thenStamp - dt
	local Day =  os.date("%A", thenStamp)
	return Day
end

function GetTime(currTime)
	year, month, day, hour, min = 0
	formatPattern = '^(%d%d%d%d)%-(%d%d)%-(%d%d)[Tt](%d%d%.?%d*):(%d%d):(%d%d)()'
	year, month, day, hour, min = currTime:match(formatPattern)
	thenStamp = os.time({year=year, month=month, day=day, hour=hour, min=min})
	local zone = os.date('%z')
	local signum, hours, minutes = zone:match '([+-])(%d%d)(%d%d)'
	local dt = (tonumber(hours)*3600 + tonumber(signum..minutes)*60)
	local offset = "-" and -1 or 1
	thenStamp = thenStamp - dt
	local Hour, Minute, AMPM =  os.date("%I", thenStamp), os.date("%M", thenStamp), os.date("%p", thenStamp)
	return Hour..':'..Minute.. ' ' ..AMPM
end

function GetIcon(CurrentCode, Sunrise, Sunset)
	local zone = os.date('%z')
	local signum, hours, minutes = zone:match '([+-])(%d%d)(%d%d)'
	local dt = (tonumber(hours)*3600 + tonumber(signum..minutes)*60)
	local offset = "-" and -1 or 1
	local code = CurrentCode
	year, month, day, hour, min = 0
	
	formatPattern = '^(%d%d%d%d)%-(%d%d)%-(%d%d)[Tt](%d%d%.?%d*):(%d%d):(%d%d)()'
	year, month, day, hour, min = Sunrise:match(formatPattern)
	
	RiseStamp = os.time({year=year, month=month, day=day, hour=hour, min=min})
	RiseStamp = RiseStamp - dt

	formatPattern = '^(%d%d%d%d)%-(%d%d)%-(%d%d)[Tt](%d%d%.?%d*):(%d%d):(%d%d)()'
	year, month, day, hour, min = Sunset:match(formatPattern)
	
	SetStamp = os.time({year=year, month=month, day=day, hour=hour, min=min})
	SetStamp = SetStamp - dt
	
	currentLocalTime = os.time(os.date('*t'))
	
	if code == '1000' then
		if currentLocalTime >= RiseStamp and currentLocalTime <= SetStamp then
			code = '1000d'
		else
			code = '1000n'
		end
	elseif code == '1100' then
		if currentLocalTime >= RiseStamp and currentLocalTime <= SetStamp then
			code = '1100d'
		else
			code = '1100n'
		end
	elseif code == '1101' then
		if currentLocalTime >= RiseStamp and currentLocalTime <= SetStamp then
			code = '1101d'
		else
			code = '1101n'
		end
	elseif code == '1102' then
		if currentLocalTime >= RiseStamp and currentLocalTime <= SetStamp then
			code = '1102d'
		else
			code = '1102n'
		end
	elseif code == '6201' or code == '6200' or code == '6000' then
			code = '6001'
	elseif code == '7101' or code == '7102' then
			code = '7000'
	elseif code == '3000' or code == '3002' then
			code = '3001'
	end
	return code
end

function GetBearing(currBearing)
	local bearing = "N/A"
	if currBearing >= 348.75 or currBearing < 11.25 then
		bearing = "N"
	elseif currBearing >= 11.25 and currBearing < 33.75 then
		bearing = "NNE"
	elseif currBearing >= 33.75 and currBearing < 56.25 then
		bearing = "NE"
	elseif currBearing >= 56.25 and currBearing < 78.75 then
		bearing = "ENE"
	elseif currBearing >= 78.75 and currBearing < 101.25 then
		bearing = "E"
	elseif currBearing >= 101.25 and currBearing < 123.75 then
		bearing = "ESE"
	elseif currBearing >= 123.75 and currBearing < 146.25 then
		bearing = "SE"
	elseif currBearing >= 146.25 and currBearing < 168.75 then
		bearing = "SSE"
	elseif currBearing >= 168.75 and currBearing < 191.25 then
		bearing = "S"
	elseif currBearing >= 191.25 and currBearing < 213.75 then
		bearing = "SSW"
	elseif currBearing >= 213.75 and currBearing < 236.25 then
		bearing = "SW"
	elseif currBearing >= 236.25 and currBearing < 258.75 then
		bearing = "WSW"
	elseif currBearing >= 258.75 and currBearing < 281.25 then
		bearing = "W"
	elseif currBearing >= 281.25 and currBearing < 303.75 then
		bearing = "WNW"
	elseif currBearing >= 303.25 and currBearing < 326.25 then
		bearing = "NW"
	elseif currBearing >= 326.25 and currBearing < 348.75 then
		bearing = "NNW"
	elseif currBearing == "0" then
		bearing = "N/A"
	end
	return bearing
end

function WindConversion(windSpd, conversion)
	local speed = 0
	speed = windSpd * conversion
	return math.floor(speed+0.5)
end