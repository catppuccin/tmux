set -l flavors latte frappe macchiato mocha

for flavor in $flavors
    magick $flavor.webp -crop '1320x50+0+464' +repage $flavor-crop.webp
end

catwalk {latte,frappe,macchiato,mocha}-crop.webp --output preview.webp --layout column

for flavor in $flavors
    rm $flavor-crop.webp
end
