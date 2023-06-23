set env vars
set -o allexport; source .env; set +o allexport;

mkdir -p ./s3_data;
chown -R 1001:1001 ./s3_data;

mkdir -p ./db_data;
chown -R 1001:1001 ./db_data;

secret=$(openssl rand -base64 24 | tr -d '\n' ; echo)

sed -i "s~SECRET_TO_CHANGE~${secret}~g" ./docker-compose.yml