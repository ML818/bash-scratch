#!/bin/bash

PS3="Enter a city name: "

select city in Tokyo London "Los Angeles" Moscow Dubai Manchester "New York" Paris Bangalore Johannesburg Istanbul Milan "Abu Dhabi" Pune Nairobi Berlin Karachi
do
	case "$city" in
		Tokyo) country="Japan";;
		London | Manchester) country="British";;
		"Los Angeles" | "New York") country="USA";;
		Moscow) country="Russia";;
		Dubai | "Abu Dhabi") country="United Arab Emirates";;
		Paris) country="France";;
		Bangalore | Pune) country="India";;
		Johannesburg) country="South Africa";;
		Istanbul) country="Turkey";;
		Milan) country="Italy";;
		Nairobi) country="Kenya";;
		Berlin) country="Germany";;
		Karachi) country="Pakistan";;
		*) echo "$city is out of range."
	esac
	echo "$city in $country"
	break
done

