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
	
	if code == 'clear' then
		if currentLocalTime >= RiseStamp and currentLocalTime <= SetStamp then
			code = 'clear_day'
		else
			code = 'clear_night'
		end
	elseif code == 'mostly_clear' then
		if currentLocalTime >= RiseStamp and currentLocalTime <= SetStamp then
			code = 'mostly_clear_day'
		else
			code = 'mostly_clear_night'
		end
	elseif code == 'partly_cloudy' then
		if currentLocalTime >= RiseStamp and currentLocalTime <= SetStamp then
			code = 'partly_cloudy_day'
		else
			code = 'partly_cloudy_night'
		end
	elseif code == 'mostly_cloudy' then
		if currentLocalTime >= RiseStamp and currentLocalTime <= SetStamp then
			code = 'mostly_cloudy_day'
		else
			code = 'mostly_cloudy_night'
		end
	elseif code == 'freezing_rain_heavy' or code == 'freezing_rain_light' or code == 'freezing_drizzle' then
			code = 'freezing_rain'
	elseif code == 'ice_pellets_heavy' or code == 'ice_pellets_light' then
			code = 'ice_pellets'
	end
	return code
end

function GetDescription(CurrentCondition)
	local description = "Not Available"
	CurrentCondition = string.gsub(CurrentCondition, "900", "Not Available")
	CurrentCondition = string.gsub(CurrentCondition, "rain_heavy", "Heavy Rain")
	CurrentCondition = string.gsub(CurrentCondition, "rain_light", "Light Rain")
	CurrentCondition = string.gsub(CurrentCondition, "freezing_rain_heavy", "Freezing Rain")
	CurrentCondition = string.gsub(CurrentCondition, "freezing_rain_light", "Freezing Rain")
	CurrentCondition = string.gsub(CurrentCondition, "ice_pellets_heavy", "Ice Pellets")
	CurrentCondition = string.gsub(CurrentCondition, "ice_pellets_light", "Ice Pellets")
	CurrentCondition = string.gsub(CurrentCondition, "snow_heavy", "Heavy Snow")
	CurrentCondition = string.gsub(CurrentCondition, "snow_light", "Light Snow")
	CurrentCondition = string.gsub(CurrentCondition, "tstorm", "Thunderstorm")
	CurrentCondition = string.gsub(CurrentCondition, "fog_light", "Mist")
	CurrentCondition = string.gsub(CurrentCondition, "_", " ")
	description = string.gsub(" "..CurrentCondition, "%W%l", string.upper):sub(2)
	return description
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