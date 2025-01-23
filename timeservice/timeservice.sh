#!/bin/bash

#
# Init env.var
#
db_host=${db_host:-unknown}
db_name=${db_name:-salt}
db_user=${db_user:-unknown}
db_passwd=${db_passwd:-hemmelig}

get_date() {
  echo `date "+%Y-%m-%d%n"`
}
export -f get_date

get_time() {
  echo `date "+%H:%M:%S"`
}
export -f get_time

get_number() {
  echo `wget -qO- $numberservice:$numberservice_port`
}
export -f get_number

store_number() {
  xx=$(psql -U postgres -d database_name -c "SELECT c_defaults  FROM user_info WHERE c_uid = 'testuser'")
}


echo "SHELL is $SHELL"
echo "TimeService - version $version"
while true ; 
  do nc -l -p 8080 -e bash -c 'echo -e "HTTP/1.1 200 OK\n
  Content-Type: application/json\n\n
  {\"date\":\"`get_date`\",
  \"time\":\"`get_time`\",
  \"number\":\"`get_number`\"}
"';
  echo 'Returned time, date and random number';
done