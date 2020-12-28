function Initalize()
end


function GetDay(dayTime)
	day = 0
	formatPattern = '^(%d%d%d%d)%-(%d%d)%-(%d%d)[Tt](%d%d%.?%d*):(%d%d):(%d%d)()'
	year, month, day, hour, min = dayTime:match(formatPattern)
	thenStamp = os.time({year=year, month=month, day=day, hour=hour})
	local Day =  os.date("%A", thenStamp)
	return Day
end

function GetTime(currTime)
	year, month, day, hour, min = 0
	formatPattern = '^(%d%d%d%d)%-(%d%d)%-(%d%d)[Tt](%d%d%.?%d*):(%d%d):(%d%d)()'
	year, month, day, hour, min = currTime:match(formatPattern)
	thenStamp = os.time({year=year, month=month, day=day, hour=hour, min=min})
	local Hour, Minute, AMPM =  os.date("%I", thenStamp), os.date("%M", thenStamp), os.date("%p", thenStamp)
	return Hour..':'..Minute.. ' ' ..AMPM
end

function GetIcon(CurrentCode)
	local icon = CurrentCode
	if CurrentCode == 'clear' then
		icon = 'sunny'
	elseif CurrentCode == 'mostly_clear' or CurrentCode == 'passing_clounds' or CurrentCode == 'more_sun_than_clouds' then
		icon = 'mostly_sunny'
	elseif CurrentCode == 'scattered_clouds' or CurrentCode == 'partly_cloudy' or CurrentCode == 'a_mixture_of_sun_and_clouds' or CurrentCode == 'increasing_cloudiness' or CurrentCode == 'breaks_of_sun_late' or CurrentCode == 'afternoon_clouds' or CurrentCode == 'morning_clouds' or CurrentCode == 'partly_sunny' or CurrentCode == 'high_level_clouds' or CurrentCode == 'low_clouds' or CurrentCode == 'decreasing_cloudiness' then
		icon = 'day_partly_cloudy'
	elseif CurrentCode == 'broken_clouds' or CurrentCode == 'mostly_cloudy' then
		icon = 'day_mostly_cloudy'
	elseif CurrentCode == 'night_scattered_clouds' or CurrentCode == 'night_partly_cloudy' or CurrentCode == 'a_mixture_of_sun_and_clouds' or CurrentCode == 'night_increasing_cloudiness' or CurrentCode == 'night_afternoon_clouds' or CurrentCode == 'night_morning_clouds' or  CurrentCode == 'night_high_level_clouds' or CurrentCode == 'night_high_clouds' or CurrentCode == 'night_decreasing_cloudiness' then
		icon = 'night_partly_cloudy'
	elseif CurrentCode == 'night_broken_clouds' then
		icon = 'night_mostly_cloudy'
	elseif CurrentCode == 'overcast' or CurrentCode == 'cloudy' then
		icon = 'cloudy'
	elseif CurrentCode == 'flurries_early' or CurrentCode == 'flurries_late' or CurrentCode == 'snow_flurries' then
		icon = 'flurries'
	elseif CurrentCode == 'light_snow_early' or CurrentCode == 'light_snow_late' then
		icon = 'light_snow'
	elseif CurrentCode == 'snow_early' or CurrentCode == 'snow_late' or CurrentCode == 'moderate_snow' then
		icon = 'snow'
	elseif CurrentCode == 'heavy_snow_early' or CurrentCode == 'heavy_snow_late' then
		icon = 'heavy_snow'
	elseif CurrentCode == 'sprinkles' or CurrentCode == 'sprinkles_early' or CurrentCode == 'sprinkles_late' or CurrentCode == 'night_sprinkles' or CurrentCode == 'light_showers' or CurrentCode == 'night_light_showers' then
		icon = 'drizzle'
	elseif CurrentCode == 'light_rain_early' or CurrentCode == 'light_rain_late' then
		icon = 'light_rain'
	elseif CurrentCode == 'rain_early' or CurrentCode == 'rain_late' then
		icon = 'rain'
	elseif CurrentCode == 'heavy_rain_early' or CurrentCode == 'heavy_rain_late' or CurrentCode == 'lots_of_rain' or CurrentCode == 'tons_of_rain' or CurrentCode == 'flash_floods' or CurrentCode == 'flood' then
		icon = 'heavy_rain'
	elseif CurrentCode == 'a_few_showers' or CurrentCode == 'passing_showers' or CurrentCode == 'rain_showers' or CurrentCode == 'showers' or CurrentCode == 'numerous_showers' or CurrentCode == 'showery' then
		icon = 'day_scattered_showers'
	elseif CurrentCode == 'night_a_few_showers' or CurrentCode == 'night_passing_showers' or CurrentCode == 'night_rain_showers' or CurrentCode == 'night_showers' then
		icon = 'night_scattered_showers'
	elseif CurrentCode == 'scattered_flurries' or CurrentCode == 'snow_showers' or CurrentCode == 'snow_showers_early' or CurrentCode == 'light_snow_showers' then
		icon = 'day_snow_showers'
	elseif CurrentCode == 'snow_showers_late' then
		icon = 'night_snow_showers'
	elseif CurrentCode == 'tstorms' or CurrentCode == 'tstorms_late' or CurrentCode == 'night_tstorms' or CurrentCode == 'tstorms_early' then
		icon = 'thunderstorms'
	elseif CurrentCode == 'strong_thunderstorms' then
		icon = 'severe_thunderstorms'
	elseif CurrentCode == 'isolated_tstorms_late' or CurrentCode == 'isolated_tstorms' or CurrentCode == 'a_few_tstorms' or CurrentCode == 'scattered_tstorms_late' or CurrentCode == 'widely_scattered_tstorms' then
		icon = 'day_scattered_tstorms'
	elseif CurrentCode == 'night_widely_scattered_tstorms' or CurrentCode == 'night_isolated_tstorms' or CurrentCode == 'night_a_few_tstorms' then
		icon = 'night_scattered_tstorms'
	elseif CurrentCode == 'light_freezing_rain' then
		icon = 'freezing_rain'
	elseif CurrentCode == 'icy_mix_late' or CurrentCode == 'light_icy_mix_late' or CurrentCode == 'icy_mix_early' or CurrentCode == 'light_icy_mix_early' then
		icon = 'icy_mix'
	elseif CurrentCode == 'light_mixture_of_precip' or CurrentCode == 'mixture_of_precip' or CurrentCode == 'heavy_mixture_of_precip' or CurrentCode == 'snow_changing_to_an_icy_mix' or CurrentCode == 'an_icy_mix_changing_to_snow' or CurrentCode == 'an_icy_mix_changing_to_rain' or CurrentCode == 'rain_changing_to_an_icy_mix' then
		icon = 'sleet'
	elseif CurrentCode == 'snow_changing_to_rain' or CurrentCode == 'rain_changing_to_snow' then
		icon = 'snow_rain_mix'
	elseif CurrentCode == 'hazy_sunshine' or CurrentCode == 'haze' or CurrentCode == 'smoke' or CurrentCode == 'low_level_haze' or CurrentCode == 'early_fog_followed_by_sunny_skies' or CurrentCode == 'early_fog' or CurrentCode == 'light_fog' or CurrentCode == 'dense_fog' or CurrentCode == 'night_haze' or CurrentCode == 'night_smoke' or CurrentCode == 'night_low_level_haze' then
		icon = 'fog'
	elseif CurrentCode == 'tropical_storm' then
		icon = 'hurricane'
	elseif CurrentCode == 'sandstorm' then
		icon = 'duststorm'
	elseif CurrentCode == 'snowstorm' then
		icon = 'blizzard'
	end
	return icon
end

function SplitDescription(desc)
	for line in desc:gsub("%f[.]%.%f[^.]", "\0"):gmatch"%Z+" do 
	   return line
	end
end