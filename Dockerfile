FROM puckel/docker-airflow:1.10.6-1

LABEL maintainer="Gabriele Diener <g.diener@me.com>" \
    image="gdiener/kube-airflow" \
    repository="https://github.com/gadiener/kube-airflow" \
    vendor="jobtome" \
    description="Docker image with Airflow and Kubernetes plugin." \
    license="MIT"

COPY ./requirements.txt ./requirements.txt

RUN pip install --user -r requirements.txt