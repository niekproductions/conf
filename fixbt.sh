#!/bin/sh
sudo pactl unload-module module-bluetooth-discover
sudo pactl load-module module-bluetooth-discover
