ARG AIRFLOW_VERSION=1.10.7
FROM puckel/docker-airflow:${AIRFLOW_VERSION}

ARG AIRFLOW_VERSION

LABEL maintainer="Gabriele Diener <g.diener@me.com>" \
    image="gdiener/kube-airflow" \
    repository="https://github.com/gadiener/kube-airflow" \
    vendor="jobtome" \
    description="Docker image with Airflow and Kubernetes plugin." \
    license="MIT"

COPY ./requirements.txt ./requirements.txt

RUN sed -i "s/\${AIRFLOW_VERSION}/${AIRFLOW_VERSION}/g" requirements.txt && \
    pip install --user -r requirements.txt