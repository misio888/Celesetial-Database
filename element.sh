#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"

if [[ $1 ]]
then
  if [[ ! $1 =~ ^[0-9]+$ ]]
  then
    E=$($PSQL "SELECT atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, symbol, name, type FROM properties JOIN elements USING(atomic_number) JOIN types USING(type_id) WHERE elements.name LIKE '$1%' ORDER BY atomic_number Limit 1")
  else
     E=$($PSQL "SELECT atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, symbol, name, type FROM properties JOIN elements USING(atomic_number) JOIN types USING(type_id) WHERE elements.atomic_number=$1")
  fi
  if [[ -z $E ]]
  then
    echo "I could not find that element in the database."
  else
    echo $E | while IFS=\| read A_N A_M MPC BPC S N TY
    do
      echo "The element with atomic number $A_N is $N ($S). It's a $TY, with a mass of $A_M amu. $N has a melting point of $MPC celsius and a boiling point of $BPC celsius."
    done
  fi
  else
    echo "Please provide an element as an argument."
fi