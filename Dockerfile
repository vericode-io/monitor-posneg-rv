FROM docker.io/fluent/fluentd:v1.16-1

USER root
RUN apk add --no-cache --update --virtual .build-deps \
        sudo build-base ruby-dev \
    && sudo gem install fluent-plugin-grafana-loki -v 1.2.20 \
    && sudo gem install xml-simple \
    && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

USER fluent