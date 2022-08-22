local my_functions = {}

function my_functions.get_drives()
    drives = {}
    for drive in io.popen("df | grep -e sd -e nvm | rev | cut -d' ' -f1 | rev"):lines() do
        table.insert(drives, drive)
    end
    return drives
end

function my_functions.toggle_bar()
    -- If a client is fullscreen, hide the bar
    clients = awful.screen.focused():get_clients()
    for k, c in pairs(clients) do
        c = value
        if c.fullscreen then
            myscreen = awful.screen.focused()
            myscreen.mywibox.visible = false
        else
            myscreen = awful.screen.focused()
            myscreen.mywibox.visible = true
        end
    end
end


return my_functions
