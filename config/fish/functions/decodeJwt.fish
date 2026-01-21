function decodeJwt
    jq -n --arg input "$argv[1]" '$input | split(".") | .[:2] | map(@base64d) | map(fromjson)'
end
