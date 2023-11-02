#!/usr/bin/env bash
#set env vars
set -o allexport; source .env; set +o allexport;

mkdir -p ./s3_data;
chown -R 1001:1001 ./s3_data;

mkdir -p ./db_data;
chown -R 1001:1001 ./db_data;

secret=$(openssl rand -base64 24 | tr -d '\n' ; echo)

sed -i "s~SECRET_TO_CHANGE~${secret}~g" ./docker-compose.yml

cat /opt/elestio/startPostfix.sh > post.txt
filename="./post.txt"

SMTP_LOGIN=""
SMTP_PASSWORD=""

# Read the file line by line
while IFS= read -r line; do
  # Extract the values after the flags (-e)
  values=$(echo "$line" | grep -o '\-e [^ ]*' | sed 's/-e //')

  # Loop through each value and store in respective variables
  while IFS= read -r value; do
    if [[ $value == RELAYHOST_USERNAME=* ]]; then
      SMTP_LOGIN=${value#*=}
    elif [[ $value == RELAYHOST_PASSWORD=* ]]; then
      SMTP_PASSWORD=${value#*=}
    fi
  done <<< "$values"

done < "$filename"

rm post.txt

cat << EOT >> ./.env

SMTP_HOST=tuesday.mxrouting.net
SMTP_PORT=465
SMTP_USERNAME=${SMTP_LOGIN}
SMTP_PASSWORD=${SMTP_PASSWORD}
NEXT_PUBLIC_SMTP_FROM=${SMTP_LOGIN}
SMTP_SECURE=true
ENCRYPTION_SECRET=${secret}
EOT