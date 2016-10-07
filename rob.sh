#!/usr/bin/env bash

echo "______ ___________         _   _  _____  _____ ";
echo "| ___ \  _  | ___ \       | | | |/ __  \|  _  |";
echo "| |_/ / | | | |_/ /       | | | |\`' / /'| |/' |";
echo "|    /| | | | ___ \       | | | |  / /  |  /| |";
echo "| |\ \\ \_/ / |_/ /       \ \_/ /./ /___\ |_/ /";
echo "\_| \_|\___/\____/         \___/ \_____(_)___/ ";
echo "n=next, l=too long, e=stop, g=good, b=bad, h=how do you feel about it?";
echo "                                               ";

function sayE {
    say $1
    echo $1
}

sayE "Good morning everyone"

read

sayE "How are you today yaseck?"

read -p ">>" jacekFeeling

if [ jacekFeeling = 'g' ]; then
    say "good"
else
    say "I'm sorry to hear that"
fi

sayE "Any updates to production?"

read -p ">>" prodUpdates

if [ $prodUpdates = 'n' ]; then
    sayE "okay, moving on"
fi
declare -a nextTicketResponses=('Next Ticket', 'what about this one?', "Okay, let's talk about this now")
declare -a tooLongResponses=("Maybe we should talk about this after the standup", "Let's take this offline", "Okay, let's talk about this now")

sayE "Okay great, let's talk about this ticket"

RUN=true

while ${RUN}; do

    read -p ">>" response

    if [ $response = "n" ]; then
        index=$( jot -r 1  0 $((${#nextTicketResponses[@]} - 1)) )
        selected_expression=${nextTicketResponses[index]}
        sayE $selected_expression
    elif [ $response = "l" ]; then
        index=$( jot -r 1  0 $((${#tooLongResponses[@]} - 1)) )
        selected_expression=${nextTicketResponses[index]}
        sayE $selected_expression
    elif [ $response = "h" ]; then
        sayE "Well how do you feel about this?"
    elif [ $response = "e" ]; then
        RUN=false
        sayE "Okay, great, thanks everyone"
    fi
done