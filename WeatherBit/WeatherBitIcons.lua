function Update()
	WeatherCurrentCode = SKIN:GetMeasure('MeasureWeatherCurrentCode')
	WeatherCurrentPod = SKIN:GetMeasure('MeasureWeatherCurrentPod')
	CurrentCode = WeatherCurrentCode:GetValue()
	CurrentPod = WeatherCurrentPod:GetStringValue()
	local code
	if CurrentCode == 800 and CurrentPod == "n" then
		code = 805
	elseif CurrentCode == 801 and CurrentPod == "n" then
		code = 806
	elseif CurrentCode == 802 and CurrentPod == "n" then
		code = 807
	elseif CurrentCode == 803 and CurrentPod == "n" then
		code = 808
	elseif CurrentCode == 900
		code = 900
	else
		code = CurrentCode
	end
	return code
end