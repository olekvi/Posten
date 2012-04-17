#!/bin/bash

URL="http://www.bring.no/hele-bring/forside/_attachment/159761?_ts=136ab4bb030" 
JS="p.js"
if [ $1 ]; then 
	JS=$1
fi


echo "var p = new Array();" > $JS; 

curl --silent $URL | iconv -f ISO-8859-1 -t utf-8 | perl -lane 'printf "p[%s] = \"%s\";\n", $F[0], $F[1]' >> $JS
