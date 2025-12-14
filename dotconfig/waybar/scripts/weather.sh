#!/bin/bash

# ===== CONFIGURE YOUR LOCATION =====
LAT="24.537006320658723"    # Example: Riyadh latitude
LON="46.66417330700733"    # Example: Riyadh longitude
# ====================================

url="https://api.open-meteo.com/v1/forecast?latitude=${LAT}&longitude=${LON}&current_weather=true"

weather=$(curl -sf "$url")

if [ -z "$weather" ]; then
    echo '{"text": "Weather: N/A"}'
    exit 0
fi

temp=$(echo "$weather" | jq -r '.current_weather.temperature' | sed 's/\.0°C/°C/' | sed 's/\.0$//')

echo "${temp}°C"
