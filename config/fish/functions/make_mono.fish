function make_mono
    if test -z "$argv[1]"
        echo "Usage: make_mono DIRECTORY"
        return 1
    end
    set path (realpath "$argv[1]")

    for f in (find $path -name \*.wav)
        set sourcedir (basename (dirname "$f"))
        set outdir (path normalize (dirname "$f")/../"$sourcedir (mono)")
        set outfile (path change-extension .mono.wav (basename $f))

        mkdir -p "$outdir"
        ffmpeg -i "$f" -ac 1 "$outdir/$outfile"
    end
end
