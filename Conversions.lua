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

function GetDescription(CurrentCondition)
	local description = "Not Available"
	CurrentCondition = string.gsub(CurrentCondition, "Thunderstorm with light rain", "Light Thunderstorm")
	CurrentCondition = string.gsub(CurrentCondition, "Thunderstorm with rain", "Thunderstorm")
	CurrentCondition = string.gsub(CurrentCondition, "Thunderstorm with heavy rain", "Heavy Thunderstorm")
	CurrentCondition = string.gsub(CurrentCondition, "Thunderstorm with light drizzle", "Light Drizzle Thunderstorm")
	CurrentCondition = string.gsub(CurrentCondition, "thunderstorm with drizzle", "Drizzle Thunderstorm")
	CurrentCondition = string.gsub(CurrentCondition, "thunderstorm with heavy drizzle", "Heavy drizzle Thunderstorm")
	CurrentCondition = string.gsub(CurrentCondition, "Thunderstorm with Hail", "Hail")
	CurrentCondition = string.gsub(CurrentCondition, "Moderate Rain", "Rain")

	--[[ This block is optional if you want the descriptions from WeatherBit you can comment them out by using
	-- in front of the line --]]
	CurrentCondition = string.gsub(CurrentCondition, "Clear sky", "Clear")
	CurrentCondition = string.gsub(CurrentCondition, "Few clouds", "Mostly Clear")
	CurrentCondition = string.gsub(CurrentCondition, "Scattered clouds", "Partly Cloudy")
	CurrentCondition = string.gsub(CurrentCondition, "Broken clouds", "Mostly Cloudy")
	CurrentCondition = string.gsub(CurrentCondition, "Overcast clouds", "Overcast")

	description = string.gsub(" "..CurrentCondition, "%W%l", string.upper):sub(2)
	return description
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