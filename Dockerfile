FROM alpine:3.8
ENV NGINX_PORT 8080

ENV PROXY_HOST_1 127.0.0.1
ENV PROXY_HOST_2 127.0.0.2
ENV PROXY_HOST_3 127.0.0.3
ENV PROXY_HOST_4 127.0.0.4
ENV PROXY_HOST_5 127.0.0.5

ENV PROXY_PATH_1 any1
ENV PROXY_PATH_2 any2
ENV PROXY_PATH_3 any3
ENV PROXY_PATH_4 any4
ENV PROXY_PATH_5 any5

RUN apk add nginx bash
COPY my.sh /etc/nginx/my.sh
RUN chmod +x /etc/nginx/my.sh
RUN mkdir -p /run/nginx
#CMD ["/etc/nginx/my.sh"]
#RUN nginx -t
RUN sed -i s/80/$NGINX_PORT/g /etc/nginx/conf.d/default.conf


#EXPOSE 80 443
#ENTRYPOINT ["/etc/nginx/my.sh"]
#CMD ["nginx", "-g", "daemon off;"]

CMD /etc/nginx/my.sh && nginx -g 'daemon off;'
