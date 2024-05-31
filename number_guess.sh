#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only --no-align -c"
NUMBER=$(($RANDOM % 1000 + 1))
SECRET=0
ATTEMPS=0

echo "Enter your username:"
read NAME
GETNAME=$($PSQL "SELECT name from users where name='$NAME'")
if [[ -z $GETNAME ]]
then
  echo "Welcome, $NAME! It looks like this is your first time here."
  UPDATENAME=$($PSQL "INSERT INTO users(name, games_played,best_game) values('$NAME',0,100)")
else
  GETINFO=$($PSQL "SELECT name,games_played,best_game FROM users WHERE name='$NAME'")
  IFS="|"  read name games_played best_game <<< "$GETINFO"
  echo "Welcome back, $name! You have played $games_played games, and your best game took $best_game guesses."
fi
echo "Guess the secret number between 1 and 1000:"
while [[ $SECRET != $NUMBER ]]
do
  read SECRET
  ((ATTEMPS++))
  if [[ $SECRET =~ ^-?[0-9]+$ ]]; then
    if (( SECRET > NUMBER )); then
      echo "It's lower than that, guess again:"
    elif (( SECRET < NUMBER )); then
      echo "It's higher than that, guess again:"
    fi
  else
    echo "That is not an integer, guess again:"
  fi
done
echo "You guessed it in $ATTEMPS tries. The secret number was $NUMBER. Nice job!"
GETBEST=$($PSQL "SELECT best_game from users WHERE name='$NAME'")
if [[ $GETBEST < $ATTEMPS ]]
then
  UPDATE=$($PSQL "UPDATE users SET games_played=games_played+1,best_game=$ATTEMPS WHERE name='$NAME'")
else
  UPDATE=$($PSQL "UPDATE users SET games_played=games_played+1 WHERE name='$NAME'")
fi