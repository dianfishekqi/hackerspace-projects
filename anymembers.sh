#!/bin/sh
#Authon Dian Fishekqi
#Will use the indicator on the website to fetch the number of Memebers currenty in the hackerspace

URL="http://www.prishtinahackerspace.org/"

members=$(curl -s $URL | egrep -o "openornot\">[a-zA-Z0-9 ]+"  | egrep -o "[0-9][0-9]?" | head -1)

#I use i3w so i3-nagbar is a convinent way to display the status

i3-nagbar -m "$members member(s) in the Space" -t warning &

PID=$!
#Kill the nagbar after 3s 
sleep 3s && kill $PID
