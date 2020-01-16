# Defined in - @ line 2
function proctrack
	set orig "$argv[1]"
    if test -z $orig
        echo "Usage: proctrack INPUT"
    else
        set splt (string split . "$orig")
        set trimmed $splt[1]_TRIM.$splt[2]
        trimtrack $orig
        normtrack $trimmed
    end
end
