#!/bin/bash

shutdown_time="07:30"

# Calcular o horário do desligamento no formato 24 horas
shutdown_hour=$(echo $shutdown_time | cut -d':' -f1)
shutdown_minute=$(echo $shutdown_time | cut -d':' -f2)

# Agendar desligamento
echo "O sistema vai desligar às $shutdown_time"
sudo shutdown -h $shutdown_hour:$shutdown_minute

# Dormir por uma duração específica antes de reiniciar (por exemplo, 10 minutos)
sleep_duration=0.1m

# Dormir pelo tempo especificado antes de reiniciar
sleep $sleep_duration
echo "O sistema vai reiniciar após $sleep_duration"
sudo reboot


#restar pc with contrab
 
