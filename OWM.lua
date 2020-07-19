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

function GetIcon(CurrentCode, CurrentIcon)
	local icon
	local daytime
	if string.find(CurrentIcon, "d") then
		daytime = "day"
	else
		daytime = "night"
	end
	if CurrentCode >= 200 and CurrentCode < 300 then
		if CurrentCode == 202 or CurrentCode == 212 or CurrentCode == 232 then
			icon = 201
		elseif CurrentCode == 221 then
			if daytime == "day" then
				icon = 202
			else
				icon = 203
			end
		else
			icon = 200
		end			
	elseif CurrentCode >= 300 and CurrentCode < 400 then
		icon = 300
	elseif CurrentCode >= 500 and CurrentCode < 600 then
		if CurrentCode == 502 or CurrentCode == 503 or CurrentCode == 504 or CurrentCode == 522 then
			icon = 501
		elseif CurrentCode == 511 then
			icon = 502
		elseif CurrentCode == 531 then
			if daytime == "day" then
				icon = 503
			else
				icon = 504
			end
		else
			icon = 500
		end
	elseif CurrentCode >= 600 and CurrentCode < 700 then
		if CurrentCode == 600 or CurrentCode == 620 then
			icon = 600
		elseif CurrentCode == 602 or CurrentCode == 622 then
			icon = 602
		elseif CurrentCode == 611 or CurrentCode == 612 or CurrentCode == 613 then
			icon = 603
		elseif CurrentCode == 615 or CurrentCode == 616 then
			icon = 604
		else
			icon = 601
		end
	elseif CurrentCode >= 700 and CurrentCode < 800 then
		if CurrentCode == 771 then
			icon = 701
		elseif CurrentCode == 781 then
			icon = 702
		else
			icon = 700
		end
	elseif CurrentCode == 800 then
		if daytime == "day" then
			icon = 800
		else
			icon = 805
		end
	elseif CurrentCode == 801 then
		if daytime == "day" then
			icon = 801
		else
			icon = 806
		end
	elseif CurrentCode == 802 then
		if daytime == "day" then
			icon = 802
		else
			icon = 807
		end
	elseif CurrentCode == 803 then
		if daytime == "day" then
			icon = 803
		else
			icon = 808
		end
	else
		icon = CurrentCode
	end
	return icon
end

function GetDescription(CurrentCondition)
	local description = "Not Available"
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