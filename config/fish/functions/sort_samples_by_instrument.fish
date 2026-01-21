function sort_samples_by_instrument
    if test -z "$argv"
        echo "usage: sort_samples_by_instrument DIRECTORY"
        return 1
    end

    set sourcedir (realpath $argv[1])
    set packname (basename "$sourcedir")
    set target (dirname "$sourcedir")/"$packname (by instrument)"

    echo Scanning $sourcedir
    echo Copying samples to $target

    mkdir -p $target

    for f in (find "$sourcedir" -type f -iname \*.wav)
        set filename (basename $f)
        set words (string split ' ' "$filename")
        set instrument $words[1]
        set parts (string split . "$filename")
        set name "$parts[1].$parts[2]"
        mkdir -p "$target/$instrument"
        cp -v "$f" "$target/$instrument/$name"
    end
end
