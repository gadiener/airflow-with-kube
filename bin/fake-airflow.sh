#!/usr/bin/env bash

set -e

: "${AIRFLOW__CORE__BASE_LOG_FOLDER:=/usr/local/airflow/logs}"

case "$1" in
  run)
    if [ -n "${AIRFLOW__CORE__WORKER_LOG_SERVER_PORT}" ]; then
        if [ "${AIRFLOW__CORE__BASE_LOG_FOLDER}" != "/usr/local/airflow/log" ]; then
          ln -s "${AIRFLOW__CORE__BASE_LOG_FOLDER}" /usr/local/airflow/log
        fi
        echo "$(date) - Running http server on port '${AIRFLOW__CORE__WORKER_LOG_SERVER_PORT}' and folder '${AIRFLOW__CORE__BASE_LOG_FOLDER}'"
        python -m http.server --directory "/usr/local/airflow/" "${AIRFLOW__CORE__WORKER_LOG_SERVER_PORT}" &
    fi

    exec airflow-real "$@"
    ;;

  *)
    exec airflow-real "$@"
    ;;
esac