#!/usr/bin/env bash

# check_todo_active=$( pgrep -fx "st -e vim /home/gautierk/Documents/journal/journal.md /home/gautierk/Documents/journal/mistakes.md /home/gautierk/Documents/journal/books.md /home/gautierk/Documents/journal/charisma.md /home/gautierk/Documents/journal/dreams.md /home/gautierk/Documents/journal/quotes.md")
check_todo_active="$(ps -aux | grep -c "journal\/journal.md")"

# notify-send "Status: $check_todo_active"


if [[ $check_todo_active -gt 0 ]]
then
  i3-msg workspace 15:Journal
  # notify-send "active"
else
  i3-msg workspace 15:Journal
  # notify-send "not active"
  st -e vim ~/Documents/journal/* 
fi
