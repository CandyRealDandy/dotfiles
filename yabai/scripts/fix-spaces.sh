move_windows_to_spaces() {
    # Get all window IDs for each app and move them
    yabai -m query --windows | jq -r '.[] | select(.app=="Obsidian") | .id' | xargs -I{} yabai -m window {} --space notes
    yabai -m query --windows | jq -r '.[] | select(.app=="Floorp") | .id' | xargs -I{} yabai -m window {} --space web
    yabai -m query --windows | jq -r '.[] | select(.app=="Alacritty") | .id' | xargs -I{} yabai -m window {} --space term
    yabai -m query --windows | jq -r '.[] | select(.app=="Alacritty-Graphics") | .id' | xargs -I{} yabai -m window {} --space term
    yabai -m query --windows | jq -r '.[] | select(.app=="Visual Studio Code") | .id' | xargs -I{} yabai -m window {} --space code
    yabai -m query --windows | jq -r '.[] | select(.app=="WhatsApp") | .id' | xargs -I{} yabai -m window {} --space chat
    yabai -m query --windows | jq -r '.[] | select(.app=="Telegram") | .id' | xargs -I{} yabai -m window {} --space chat
    yabai -m query --windows | jq -r '.[] | select(.app=="Microsoft Outlook") | .id' | xargs -I{} yabai -m window {} --space mail
    yabai -m query --windows | jq -r '.[] | select(.app=="YouTube Music") | .id' | xargs -I{} yabai -m window {} --space music
}