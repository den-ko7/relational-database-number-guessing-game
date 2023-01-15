#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME
SELECT_USER=$($PSQL "SELECT name FROM user_names WHERE name='$USERNAME'")
SELECT_USER_ID=$($PSQL "SELECT user_id FROM user_names WHERE name='$USERNAME'")
RANDOM_GAME_NUMBER=$(( RANDOM%1000 ))
GUESSES=0

GUESSED_NUMBER(){
read USER_GUESS
if ! [[ "$USER_GUESS" =~ ^[0-9]+$ ]]
then
echo "That is not an integer, guess again:"
GUESSED_NUMBER
return
fi

if [[ $USER_GUESS -lt $RANDOM_GAME_NUMBER ]]
then
(( GUESSES++ ))
echo "It's higher than that, guess again:"

GUESSED_NUMBER

elif [[ $USER_GUESS -gt $RANDOM_GAME_NUMBER ]]
then
(( GUESSES++ ))
echo "It's lower than that, guess again:"

GUESSED_NUMBER

elif [[ $USER_GUESS -eq $RANDOM_GAME_NUMBER ]]
then
(( GUESSES++ ))
echo "You guessed it in $GUESSES tries. The secret number was $RANDOM_GAME_NUMBER. Nice job!"
INSERT_RESULTS=$($PSQL "INSERT INTO games(guess_total, user_id) VALUES('$GUESSES', '$SELECT_USER_ID')")
fi
}

if [[ -z $SELECT_USER ]]
then
INSERT_USER=$($PSQL "INSERT INTO user_names(name) VALUES('$USERNAME')")

echo -e "Welcome, $USERNAME! It looks like this is your first time here.\n"

echo "Guess the secret number between 1 and 1000:"
SELECT_USER_ID=$($PSQL "SELECT user_id FROM user_names WHERE name='$USERNAME'")
GUESSED_NUMBER
else

# if user exists check if they have actually completed a game
GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games WHERE user_id='$SELECT_USER_ID'") 
if [[ $GAMES_PLAYED -eq 0 ]]
then
echo "Welcome, $USERNAME! It looks like this is your first time here."

echo "Guess the secret number between 1 and 1000:"
GUESSED_NUMBER
fi
BEST_GAME=$($PSQL "SELECT MIN(guess_total) FROM games WHERE user_id='$SELECT_USER_ID'")

echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

echo "Guess the secret number between 1 and 1000:"
GUESSED_NUMBER
fi
