package.path = package.path .. ";data/scripts/lib/?.lua"

-- namespace Spiral
Spiral = {}

include("callable")

function Spiral.initialize()
	local player = Player()
    player:registerCallback("onShowGalaxyMap", "handlePrintSpiral")
	--eprint("Registered Callback onShowGalaxyMap")
end


function Spiral.handlePrintSpiral()
	eprint("Running handlePrintSpiral")
	--Spiral.printSpiral(10,10)
end

function Spiral.printSpiral(endingRow, endingColumn)
	local x = 0
	local y = 0
	local d = 1
	local m = 1
	
	repeat
		while 2 * x * d < m do
			eprint("%i - %i", x, y)
			x = x + d
		end
		
		while 2 * y * d < m do
			eprint("%i - %i", x, y)
			y = y + d
		end
		
		d = -1 * d
		m = m + 1
	until y == endingRow or x == endingColumn
	
	--print last square
	eprint("%i - %i", x, y)
end
