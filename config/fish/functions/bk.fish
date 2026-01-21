# Defined in - @ line 1
function bk
	cp -ri $1 (date +%y%m%d-%H%M)-$1
end
