require("iuplua")

-- Create a button
btn = iup.button{title="Click Me", size="50x20"}

-- Define a callback function for the button
function btn:action()
  iup.Message("Hello", "Hello World from IupLua!")
end

-- Create a dialog (window) containing the button
dlg = iup.dialog{btn; title="Test App", size="100x50"}

-- Show the dialog
dlg:show()

-- Start the main loop (if not already running)
if (iup.MainLoopLevel() == 0) then
  iup.MainLoop()
end

