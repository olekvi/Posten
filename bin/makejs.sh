#!/bin/bash

URL="http://www.bring.no/hele-bring/forside/_attachment/159761?_ts=136ab4bb030" 
JS="web.js"
JSTEMPLATE="web.js.tpl"
if [ $1 ]; then 
	JS=$1
fi


cp $JSTEMPLATE $JS
echo "var p = new Array();" >> $JS; 

curl --silent $URL | iconv -f ISO-8859-1 -t utf-8 | perl -F/\\t/ -lane 'printf "p[\047%s\047] = \"%s\";\n", $F[0], $F[1]' >> $JS
