if onServer() then
	oldEventScheduler_initialize = EventScheduler.initialize
	oldEventScheduler_updateServer = EventScheduler.updateServer

    function EventScheduler.initialize()
        table.insert(events, {schedule = random():getInt(1, 1) * 60, script = "sectoreventstarter", arguments = {"exterminationfleet.lua"}, minimum = 0.1 * 60, to = 700})

		pause = 5
		pauseTime = 5
        oldEventScheduler_initialize()
    end

    function EventScheduler.updateServer(timeStep)
		oldEventScheduler_updateServer(timeStep)
		local event = events[#events]
        print("Event:", event.script, event.arguments[1], "starting in", event.time, "out of", event.schedule, "with minimum", event.minimum)
    end

end