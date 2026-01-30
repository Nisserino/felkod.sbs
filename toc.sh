#!/bin/bash

# Reset readme.md to base state
cat <<EOF>README.md
Felkoder relaterade till problem skapade av "Skit bakom spakarna"

### Bord av Innehåll
EOF

# Loop through "felkoder"
err_codes=$(ls [0-9]*.md)
# sort them
sorted=($(sort -n <<<"${err_codes[*]}"))

for i in "${sorted[@]}"
do
  err_msg=$(head -n 1 $i)
  echo "[${err_msg/\#\#\# /}](${i/.md/})  " >> README.md
done

# add contributing information to readme to finish
cat <<EOF>>README.md

Om du vill bidra till projektet: [Github/Contributing](https://github.com/Nisserino/felkod.sbs/blob/main/CONTRIBUTING)

EOF
