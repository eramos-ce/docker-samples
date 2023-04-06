ARG BASE_REGISTRY=registry1.dso.mil
ARG BASE_IMAGE=ironbank/redhat/ubi/ubi8
ARG BASE_TAG=8.7

FROM ${BASE_REGISTRY}/${BASE_IMAGE}:${BASE_TAG}

RUN --mount=type=secret,id=SECRET_FROM_ENV \
    --mount=type=secret,src=secret-file.txt \ 
    cat /run/secrets/SECRET_FROM_ENV > /tmp/secret-from-env.txt && \
    echo >> /tmp/secret-from-env.txt && \
    cat /run/secrets/secret-file.txt > /tmp/secret-from-file.txt && \
    echo >> /tmp/secret-from-file.txt

CMD /bin/cat /tmp/secret-from-env.txt /tmp/secret-from-file.txt
