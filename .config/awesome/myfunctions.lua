local my_functions = {}

function my_functions.get_loc()
    local loc = io.popen("curl -s ipinfo.io/loc"):read()
    local t = my_functions.mysplit(loc, ",")
    return t
end

function my_functions.get_drives()
    local drives = {}
    for drive in io.popen("df | grep -e sd -e nvm | rev | cut -d' ' -f1 | rev"):lines() do
        table.insert(drives, drive)
    end
    return drives
end

function my_functions.toggle_bar()
    -- If a client is fullscreen, hide the bar
    local clients = awful.screen.focused():get_clients()
    for k, c in pairs(clients) do
        c = value
        if c.fullscreen then
            local myscreen = awful.screen.focused()
            myscreen.mywibox.visible = false
        else
            local myscreen = awful.screen.focused()
            myscreen.mywibox.visible = true
        end
    end
end

function my_functions.mysplit (inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end

return my_functions
