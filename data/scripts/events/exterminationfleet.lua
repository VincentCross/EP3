package.path = package.path .. ";data/scripts/lib/?.lua"

local SectorGenerator = include ("SectorGenerator")
local Placer = include("placer")
local PlanGenerator = include("plangenerator")
include("randomext")
include("stringutility")

-- namespace ExterminationFleet
ExterminationFleet = {}

function ExterminationFleet.initialize()
    if not _restoring then
        --MysteryAsteroidEvent.spawn()
		eprint("Testing ExterminationFleet init")
    end

    -- terminate the event after 15 minutes to make room since the event scheduler counts on the event disappearing at some point
    deferredCallback(1 * 60, "finalize")
end

function ExterminationFleet.finalize()
    terminate()
end

--[[
function ExterminationFleet.spawn()
    local sector = Sector()
    local x, y = sector:getCoordinates()
    local generator = SectorGenerator(x, y)

    local desc = AsteroidDescriptor()

    -- add a new component that deletes the asteroid automatically after some time
    desc:addComponent(ComponentType.DeletionTimer)
    local comp = desc:getComponent(ComponentType.DeletionTimer)
    comp.timeLeft = 15 * 60 -- 15 minutes

    -- create the plan
    local plan = PlanGenerator.makeBigAsteroidPlan(random():getFloat(40, 60), true, generator:getAsteroidType())
    plan.accumulatingHealth = false
    desc:setMovePlan(plan) -- after this, 'plan' is empty

    -- set the position
    local position = Matrix()
    position.translation = vec3(random():getInt(-200, 200), random():getInt(-200, 200), random():getInt(-200, 200))
    desc.position = position

    desc.isObviouslyMineable = true

    -- add a special title
    desc:addComponent(ComponentType.Title)
    desc.title = "Mysterious Asteroid"%_T

    -- create the asteroid
    local asteroid = sector:createEntity(desc)

    Placer.resolveIntersections({asteroid})

    MysteryAsteroidEvent.asteroidId = asteroid.id

    sector:broadcastChatMessage("", ChatMessageType.Normal, "A mysterious asteroid has appeared in the sector!"%_T)
end
]]--