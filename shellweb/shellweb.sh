#!/bin/bash

#
# Init env.var
#
#PORT=${WEB_PORT:-8080}
#time_service=${TIME_SERVICE:-timeservice}
#time_service_port=${TIME_SERVICE_PORT:-8080}


#
# Functions
#

get_time() {
  echo `date "+%H:%M:%S"`
}
export -f get_time

get_external_time() {
    echo `wget -qO- timeservice:8080 | grep time | cut -d ":" -f2- | sed 's/["},]//g'`
}
export -f get_external_time

get_external_date() {
    echo `wget -qO- timeservice:8080 | grep date | cut -d ":" -f2- | sed 's/["},]//g'`
}
export -f get_external_date

get_external_number() {
    echo `wget -qO- timeservice:8080 | grep number | cut -d ":" -f2- | sed 's/["}]//g'`
}
export -f get_external_number

# 
# Main loop
#

echo "ShellWeb - Version $version"
while true ; 
    do nc -l -p 8080 -e bash -c 'echo -e "HTTP/1.1 200 OK\n
   <html><body style=\"color:red;background-color:blue\">
   <h1 style=\"color:yellow;background-color:blue\">ShellWeb</h1>
   <p style=\"color:white;\"><strong>Ultra simple webservice</strong></p>
   <h4>Dato: $(date)</h4>
   <h4>Name: $(hostname)</h4>
   
   $(for i in 1 2 3 4 5 6 7
   do
     echo "S $i"
   done)
   
   <h2>Time: `get_external_time`</h2>
   <h2>Date: `get_external_date`</h2>
   <h3>Number: `get_external_number`</h2>
   </body></html>"'; 
done