#!/usr/bin/env bash

time=$(date "+%d-%b_%H-%M-%S")
dir="$(xdg-user-dir)/Pictures/Screenshots"
file="Screenshot_${time}_${RANDOM}.png"

iDIR="$HOME/.config/swaync/icons"
iDoR="$HOME/.config/swaync/images"
sDIR="$HOME/scripts/wm"


notify_cmd_base="notify-send -t 10000 -A action1=Open -A action2=Delete -h string:x-canonical-private-synchronous:shot-notify"
notify_cmd_shot="${notify_cmd_base} -i ${iDIR}/picture.png "
notify_cmd_shot_win="${notify_cmd_base} -i ${iDIR}/picture.png "
notify_cmd_NOT="notify-send -u low -i ${iDoR}/note.png "

# notify and view screenshot
notify_view() {

    if [[ "$1" == "area" ]]; then
        "${sDIR}/Sounds.sh" --screenshot
        resp=$(${notify_cmd_shot} " Screenshot:" " Captured by Swappy")
        case "$resp" in
            action1)
                swappy -f "$tmpfile" &
                ;;
            action2)
                rm "$tmpfile" &
                ;;
        esac

    else
        local check_file="${dir}/${file}"
        if [[ -e "$check_file" ]]; then
            "${sDIR}/Sounds.sh" --screenshot
            resp=$(timeout 5 ${notify_cmd_shot} " Screenshot" " Saved")
            case "$resp" in
                action1)
                    xdg-open "${check_file}" &
                    ;;
                action2)
                    rm "${check_file}" &
                    ;;
            esac
        else
            ${notify_cmd_NOT} " Screenshot" " NOT Saved"
            "${sDIR}/Sounds.sh" --error
        fi
    fi
}

# take shots
shotnow() {
    cd ${dir} && grim - | tee "$file" | wl-copy
    notify_view
}


shotarea() {
    tmpfile=$(mktemp --suffix=.png)
    grim -g "$(slurp)" - >"$tmpfile" 

    # Copy without saving
    if [[ -s "$tmpfile" ]]; then
        wl-copy <"$tmpfile"
        notify_view "area"
    fi
}

if [[ ! -d "$dir" ]]; then
    mkdir -p "$dir"
fi

if [[ "$1" == "--now" ]]; then
    shotnow
elif [[ "$1" == "--area" ]]; then
    shotarea
else
    echo -e "Available Options : --now --area"
fi

exit 0
