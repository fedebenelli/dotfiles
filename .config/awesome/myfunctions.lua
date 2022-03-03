local my_functions = {}

function my_functions.get_drives()
    drives = {}
    for drive in io.popen("df | grep sd | rev | cut -d' ' -f1 | rev"):lines() do
        table.insert(drives, drive)
    end
    return drives
end

return my_functions
