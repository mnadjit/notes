exiftool ./cat.jpg | sed -n "s/License\s*:\s//gp" | base64 -d | grep -oE "picoCTF{.*?}" --color=none
