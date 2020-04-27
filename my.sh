#!/bin/bash
myArray=("$PROXY_HOST_1" "$PROXY_HOST_2" "$PROXY_HOST_3" "$PROXY_HOST_4" "$PROXY_HOST_5")
VAR=8080
a=0
for i in $PROXY_PATH_{1..5}
do
#echo The  $i item
#echo "${myArray[$a]}"

let "VAR += 1"
#echo $VAR

cat <<EOF >> /etc/nginx/conf.d/default.conf
server {
    listen $VAR;

    location /$i {
            proxy_pass http://${myArray[$a]};
            #return 404;
            }
}
EOF
let "a += 1"
done

nginx -t
