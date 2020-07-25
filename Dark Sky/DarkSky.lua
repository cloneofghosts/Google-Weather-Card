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

function GetIcon(CurrentCondition, CurrentIcon, CurrentCloud)
	local icon
	local daytime
	if string.find(CurrentIcon, "day") then
		daytime = "day"
	else
		daytime = "night"
	end
	if (CurrentCondition == "Mostly Cloudy" or CurrentCondition == "Partly Cloudy" or CurrentCondition == "Clear" or CurrentCondition == "Overcast") then
		if (CurrentCloud >= 0 and CurrentCloud < 0.13) then
			icon = "clear-" .. daytime
		elseif (CurrentCloud >= 0.13 and CurrentCloud < 0.36) then
			icon = "mainly-clear-" .. daytime
		elseif (CurrentCloud >= 0.36 and CurrentCloud < 0.61) then
			icon = "partly-cloudy-" .. daytime
		elseif (CurrentCloud >= 0.61 and CurrentCloud < 0.81) then
			icon = "mostly-cloudy-" .. daytime
		else
			icon = "cloudy"
		end
	elseif string.find(CurrentCondition, "Drizzle") then
		icon = "drizzle"
	elseif string.find(CurrentCondition, "Light Rain") then
		icon = "light-rain"
	elseif string.find(CurrentCondition, "Heavy Rain") then
		icon = "heavy-rain"
	elseif string.find(CurrentCondition, "Showers") then
		icon = "showers"
	elseif string.find(CurrentCondition, "Freezing Rain") then
		icon = "freezing-rain"
	elseif string.find(CurrentCondition, "Possible Drizzle") then
		icon = "drizzle"
	elseif string.find(CurrentCondition, "Flurries") then
		icon = "flurries"
	elseif string.find(CurrentCondition, "Possible Flurries") then
		icon = "flurries"
	elseif string.find(CurrentCondition, "Light Snow") then
		icon = "light-snow"
	elseif string.find(CurrentCondition, "Heavy Snow") then
		CurrentIcon = "heavy-snow"
	elseif string.find(CurrentCondition, "Rain and Snow") then
		icon = "rain-snow"
	elseif string.find(CurrentCondition, "Light Thunderstorm") then
		icon = "light-thunderstorm"
	elseif string.find(CurrentCondition, "Heavy Thunderstorm") then
		icon = "heavy-thunderstorm"
	elseif CurrentCondition == 900 then
		icon = "na"
	else
		icon = CurrentIcon
	end
	return icon
end

function GetDescription(CurrentCondition, CurrentCloud)
	local description = "Not Available"
	if (CurrentCondition == "Mostly Cloudy" or CurrentCondition == "Partly Cloudy" or CurrentCondition == "Clear" or CurrentCondition == "Overcast") then
		if (CurrentCloud >= 0 and CurrentCloud < 0.13) then
			description = "Clear"
		elseif (CurrentCloud >= 0.13 and CurrentCloud < 0.36) then
			description = "Mainly Clear"
		elseif (CurrentCloud >= 0.36 and CurrentCloud < 0.61) then
			description = "Partly Cloudy"
		elseif (CurrentCloud >= 0.61 and CurrentCloud < 0.81) then
			description = "Mostly Cloudy"
		else
			description = "Overcast"
		end
	else
		description = CurrentCondition
	end
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

function GetHumidity(currHumidity)
	if currHumidity == "0" then
		currHumidity = 0
	end
	return (currHumidity * 100)
end