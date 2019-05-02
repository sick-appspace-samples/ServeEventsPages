--[[----------------------------------------------------------------------------

  Application Name: ServeEventsPages

  Description:
  This sample app serves an event in a script which will be available at the
  user interface.

  This sample serves an event which is then available in the user interface.
  On every timer expiration the event will be notified with the parameter passing
  to the user interface and written to a text control. The result can be seen at
  the DevicePage. The implementation can be seen in the EventsPages.msdd at the
  'ServingEvent' page.

  To make the event available it also must be served in the App Properties
  (right-click on App -> Properties -> Serves)

------------------------------------------------------------------------------]]

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
