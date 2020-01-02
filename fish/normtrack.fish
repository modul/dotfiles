# Defined in - @ line 2
function normtrack
	if test -z $argv[1]
        echo "Usage: normtrack INPUT"
    else
        set orig "$argv[1]"
        set base (basename "$orig")
        set splt (string split . "$base")
        set dest "$splt[1]_NORM.wav"
        cp -v $orig $dest
        normalize -a -12dbFS $dest
        # ffmpeg -i $orig -af "lowpass=18000,highpass=30,loudnorm=tp=-1.5:I=-16" -ar 48k $dest
    end
end
