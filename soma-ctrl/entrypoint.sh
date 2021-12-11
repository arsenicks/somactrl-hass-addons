#!/usr/bin/env bashio

export discover_timeout=$(bashio::config 'discover_timeout')
export devices_expected=$(bashio::config 'devices_expected')
export mqtt_url=$(bashio::config 'mqtt_url')
export mqtt_username=$(bashio::config 'mqtt_username')
export mqtt_password=$(bashio::config 'mqtt_password')

somactrl -t $discover_timeout -e $devices_expected --url $mqtt_url -u $mqtt_username -p $mqtt_password