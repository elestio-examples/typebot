set env vars
set -o allexport; source .env; set +o allexport;

secret=$(openssl rand -base64 24 | tr -d '\n' ; echo)

sed -i "s~SECRET_TO_CHANGE~${secret}~g" ./docker-compose.yml