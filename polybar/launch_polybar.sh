# if type "xrandr"; then
#   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#     MONITOR=$m polybar --reload toph &
#   done
# else
#   polybar --reload toph &
# fi
#

polybar-msg cmd quit
polybar toph 2>&1 | tee -a /tmp/toph.log & disown
