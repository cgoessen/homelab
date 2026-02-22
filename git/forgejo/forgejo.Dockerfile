FROM codeberg.org/forgejo/forgejo:13

RUN apk update \
    && apk upgrade \
    && apk add asciidoctor \
    && apk cache clean