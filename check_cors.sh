#!/bin/bash

echo "Testing CORS on $1"

output=$(curl -v --silent -H "Origin: http://localhost:80" -H "Access-Control-Request-Method: GET" -H "Access-Control-Request-Headers: X-Requested-With" -X OPTIONS $1  2>&1)

echo "$output"

echo "$output" | grep "< Access-Control-Allow-Origin" -q

ret=$?

if [ $ret -ne 0 ]; then 
    echo " -> Allow Origin failed"; else echo " -> Allow Origin passed"; 
fi

echo "$output" | grep "< Access-Control-Allow-Methods: POST, GET, PUT, DELETE, HEAD, OPTIONS" -q

ret=$?

if [ $ret -ne 0 ]; then 
    echo " -> Allow Methods failed"; else echo " -> Allow Methods passed"; 
fi

echo "$output" | grep "< Access-Control-Allow-Headers: Origin, Accept, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers, Cookie" -q

ret=$?

if [ $ret -ne 0 ]; 
    then echo "Allow Headers failed"; else echo " -> Allow Headers passed"; 
fi

