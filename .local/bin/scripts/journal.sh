#!/usr/bin/env bash

check_todo_active=$( pgrep -fx "st -e vim /home/gautierk/Documents/journal/journal.md /home/gautierk/Documents/journal/mistakes.md /home/gautierk/Documents/journal/books.md /home/gautierk/Documents/journal/charisma.md /home/gautierk/Documents/journal/dreams.md /home/gautierk/Documents/journal/quotes.md")

if [ $check_todo_active ]
then
  i3-msg workspace 15:Journal
else
  i3-msg workspace 15:Journal
  st -e vim ~/Documents/journal/journal.md ~/Documents/journal/mistakes.md ~/Documents/journal/books.md ~/Documents/journal/charisma.md ~/Documents/journal/dreams.md /home/gautierk/Documents/journal/quotes.md
fi
