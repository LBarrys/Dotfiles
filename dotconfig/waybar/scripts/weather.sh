#!/bin/bash

# Your Location
LAT="."
LON="."

url="https://api.open-meteo.com/v1/forecast?latitude=${LAT}&longitude=${LON}&current_weather=true"

weather=$(curl -sf "$url")

if [ -z "$weather" ]; then
    echo '{"text": "Weather: N/A"}'
    exit 0
fi

temp=$(echo "$weather" | jq -r '.current_weather.temperature' | sed 's/\.0°C/°C/' | sed 's/\.0$//')

echo "${temp}°C"
