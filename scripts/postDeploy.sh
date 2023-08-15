
set -o allexport; source .env; set +o allexport;

DOMAIN="${NEXT_PUBLIC_VIEWER_URL#https://}"

echo $DOMAIN

nginx_conf="/opt/elestio/nginx/conf.d/${DOMAIN}.conf"

sed -i "s|listen 443 ssl http2;|listen 443 ssl http2;\n\
  set \$my_server_name \$host;\n\
  \n\
  location = / {\n\
    return 301 https://\$my_server_name:8443;\n\
  }\n\
  \n\
|g" $nginx_conf

docker exec elestio-nginx nginx -s reload;