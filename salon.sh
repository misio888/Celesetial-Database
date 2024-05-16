#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n=====[ MY SALON ]=====\n"

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo "How may i help you?"
  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services")
  
  if [[ -z $AVAILABLE_SERVICES ]]
  then
    echo -e "Sorry we don't have any service available right now."
  else
    echo -e "We have such services: "
    echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
    do
      echo "$SERVICE_ID) $NAME"
    done
    read SERVICE_ID_SELECTED
    
    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then #code road requirement's
      echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
      do
        echo "$SERVICE_ID) $NAME"
      done #so redundant :D 
      read SERVICE_ID_SELECTED
    else
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE
      PHONE_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      
      if [[ -z $PHONE_NAME ]]
      then
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        INSERT_CUSTOMER_INFO=$($PSQL "INSERT INTO customers(phone,name) values('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
        echo -e "what time would you like your service ?"
        read SERVICE_TIME
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
        INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) values($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
        GET_SERVICE=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")
        echo -e "I have put you down for a$GET_SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
      else
        echo -e "what time would you like your service ?"
        read SERVICE_TIME
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
        INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) values($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
        GET_SERVICE=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")
        GET_CUSTOMER=$($PSQL "SELECT name FROM customers WHERE customer_id='$CUSTOMER_ID'")
        echo -e "I have put you down for a$GET_SERVICE at $SERVICE_TIME,$GET_CUSTOMER."
      fi
    fi
  fi
}
MAIN_MENU

