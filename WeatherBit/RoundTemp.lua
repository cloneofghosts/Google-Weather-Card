function Initalize()
end

function RoundTemp(Temperature)
	local roundedTemp
	
	if Temperature >= 0 then
		math.floor(Temperature + 0.5)
	else
		math.ceil(Temperature - 0.5)
	end
	if roundedTemp = -0 then
		roundedTemp = 0
	end
	
	return roundedTemp
end