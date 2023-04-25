
--Start of Global Scope---------------------------------------------------------

local counter = 0
-- Serving the event to make it accessible from pages.
-- it also must be served in the App Properties
Script.serveEvent('ServeEventsPages.OnMyEvent', 'OnMyEvent', 'string')

local tmr = Timer.create()
Timer.setPeriodic(tmr, true)
Timer.setExpirationTime(tmr, 1000)

--End of Global Scope-----------------------------------------------------------

--Start of Function and Event Scope---------------------------------------------

local function handleOnStarted()
  Timer.start(tmr)
  print("Timer started, see webpage for results")
end
Script.register("Engine.OnStarted", handleOnStarted)

local function handleOnExpired()
  counter = counter + 1
  -- This is actually notifying the event, the string is passed as a parameter.
  Script.notifyEvent( 'OnMyEvent', 'This is written to the Page ' .. counter .. ' times' )
end
Timer.register(tmr, 'OnExpired', handleOnExpired)

--End of Function and Event Scope------------------------------------------------
