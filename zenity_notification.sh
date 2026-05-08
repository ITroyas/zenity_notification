#!/bin/bash

while true; do
    TIME=$(zenity --entry --title="Время напоминания" \
            --text="Введите время: ")
     
    [[ -z "$TIME" ]] && break
    if [[ "$TIME" =~ ^([0-1][0-9]|2[0-3]):[0-5][0-9]$ ]]; then

	MSG=$(zenity --entry --title="Текст напоминания" \
            --text="Введите текст: ")
    	[[ -z "$MSG" ]] && break

   	 echo "zenity --info --title='Напоминание' --text='${MSG}'" | at "$TIME" 2>/dev/null

    	 zenity --info --title="Готово" --text="Напоминание добавлено на '$TIME'"
    else
	zenity --warning --title="WARNING" --text="Error time format!"
    fi	 

done
