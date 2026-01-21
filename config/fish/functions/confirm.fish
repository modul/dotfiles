function confirm
read -n 1 -P "$argv " confirmation
string match -i "y" "$confirmation" > /dev/null
end
