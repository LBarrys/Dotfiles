#!/bin/bash

# CPU usage calculation
cpu_total() {
    awk '/^cpu / {print $2+$3+$4+$5+$6+$7+$8, $5}' /proc/stat
}

read -r total1 idle1 < <(cpu_total)
sleep 0.2
read -r total2 idle2 < <(cpu_total)

total_diff=$((total2 - total1))
idle_diff=$((idle2 - idle1))
usage=$(((100 * (total_diff - idle_diff)) / total_diff))

# CPU temperature detection
temp=$(sensors 2>/dev/null | awk '
    /Package id 0:/ {gsub("+", "", $4); print $4; found=1}
    /Tctl:/ {gsub("+", "", $2); print $2; found=1}
    /Tdie:/ {gsub("+", "", $2); print $2; found=1}
    /CPU Temperature:/ {gsub("+", "", $3); print $3; found=1}
    END {if (!found) print "N/A"}
')

# Strip trailing .0
temp=$(echo "$temp" | sed 's/\.0°C/°C/' | sed 's/\.0$//')

echo "CPU: ${usage}% ${temp}"
