function wetter --description 'Wetterbericht via wttr.in'
    curl "https://wttr.in/$argv[1]"
end
