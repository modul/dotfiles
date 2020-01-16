# Defined in - @ line 2
function trimtrack
	if test -z $argv[1]
        echo "Usage: trimtrack INPUT"
    else
        set orig "$argv[1]"
        set base (basename "$orig")
        set splt (string split . "$base")
        set dest "$splt[1]_TRIM.$splt[2]"
        set dur (ffprobe -i $orig -show_entries format=duration -v quiet -of csv="p=0" | string split .)
        ffmpeg -i $orig -to $dur[1] $dest
    end
end
