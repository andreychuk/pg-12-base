FROM postgres:12-alpine3.17

ENV PERL5LIB=PERL_LOCAL_LIB_ROOT=cpan

RUN apk add --no-cache --virtual build-deps make build-base py-pip clang llvm && \
    pip install pgxnclient && \
    pgxn install safeupdate && \
    echo "shared_preload_libraries=safeupdate" >> /usr/local/share/postgresql/postgresql.conf.sample && \
    apk del build-deps

RUN apk add --no-cache --virtual .fetch-deps ca-certificates openssl
