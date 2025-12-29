#!/bin/sh
set -e

# Substitute environment variables in prometheus.yml
# We use sed to manually substitute the known variables because envsubst might not be available
# and we want to be explicit.

echo "Substituting environment variables in /etc/prometheus/prometheus.yml"

sed -i "s|\$SERVICE_METRICS_ENDPOINT|${SERVICE_METRICS_ENDPOINT}|g" /etc/prometheus/prometheus.yml
sed -i "s|\$BULL_MQ_METRICS_ENDPOINT|${BULL_MQ_METRICS_ENDPOINT}|g" /etc/prometheus/prometheus.yml
sed -i "s|\$WORKER_METRICS_ENDPOINT|${WORKER_METRICS_ENDPOINT}|g" /etc/prometheus/prometheus.yml
sed -i "s|\$WORKER_BULL_MQ_METRICS_ENDPOINT|${WORKER_BULL_MQ_METRICS_ENDPOINT}|g" /etc/prometheus/prometheus.yml

exec /bin/prometheus "$@"
