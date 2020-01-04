#!/usr/bin/env bash

check_todo_active=$(pgrep -fx "st -e vim /home/gautierk/.todo/general/todo.txt /home/gautierk/.todo/hw/todo.txt /home/gautierk/.todo/shopping/todo.txt /home/gautierk/.todo/blogideas/todo.txt")

if [ $check_todo_active ]
then
  i3-msg workspace 14:Todo
else
  i3-msg workspace 14:Todo
  st -e vim ~/.todo/general/todo.txt ~/.todo/hw/todo.txt ~/.todo/shopping/todo.txt /home/gautierk/.todo/blogideas/todo.txt
fi

# #!/usr/bin/env bash
# 
# check_todo_active=$(pgrep -fx "st -e vim /home/gautierk/.todo/general/todo.txt")
# 
# if [ $check_todo_active ]
# then
#   i3-msg workspace 20:
#   i3-msg mode "Todo"
# else
#   i3-msg workspace 21:
#   sleep .1
#   st -e vim ~/.todo/hw/todo.txt -name "hwtodo" &
#   sleep .1
#   i3-msg workspace 22:
#   sleep .1
#   st -e vim ~/.todo/shopping/todo.txt -name "shoptodo" &
#   sleep .1
#   i3-msg workspace 20:
#   sleep .1
#   st -e vim ~/.todo/general/todo.txt &
#   sleep .1
#   i3-msg mode "Todo"
# fi
