# ベースイメージを指定
FROM ubuntu:22.04

RUN apt update && apt install -y --no-install-recommends \
    python3-pip \
    python3 \
    nginx \
    fcgiwrap

# ファイルをコピー
RUN mkdir /usr/share/nginx/html/cgi-bin
COPY cgi-bin /usr/share/nginx/html/cgi-bin/
RUN chmod +x /usr/share/nginx/html/cgi-bin/*.py

COPY index.html /usr/share/nginx/html/

# fcgiwrapの設定を変更
RUN sed -i 's/FCGI_CHILDREN=\"1\"/FCGI_CHILDREN=\"3\"/' /etc/init.d/fcgiwrap

COPY nginx.conf /etc/nginx/

# ポートをエクスポート
EXPOSE 80

# CMD ["nginx", "-g", "daemon off;"]

##
## docker build -t gpt-proxy .
##

# end
