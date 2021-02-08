#!/bin/sh
KUBENAMESPACE="nexclipper"
PORTFORWARDLOG="/tmp/webstork_portforward.log"

#TEST
# promlens
kubectl port-forward --address 0.0.0.0 service/nc-promlens -n ${KUBENAMESPACE} 8080:80 \
>> $PORTFORWARDLOG 2>&1 &
kubectl port-forward --address 0.0.0.0 service/nc-promscale-connector -n ${KUBENAMESPACE} 9201:9201 \
>> $PORTFORWARDLOG 2>&1 &

# prometheus
kubectl port-forward --address 0.0.0.0 service/nc-prometheus-server -n ${KUBENAMESPACE} 9090:80 \
>> $PORTFORWARDLOG 2>&1 &

# alertmanager
kubectl port-forward --address 0.0.0.0 service/nc-prometheus-alertmanager -n ${KUBENAMESPACE} 8081:80 \
>> $PORTFORWARDLOG 2>&1 &

# pushgateway
kubectl port-forward --address 0.0.0.0 service/nc-prometheus-pushgateway -n ${KUBENAMESPACE} 9091:9091 \
>> $PORTFORWARDLOG 2>&1 &

# grafana
kubectl port-forward --address 0.0.0.0 service/nc-grafana -n ${KUBENAMESPACE} 80:80 \
>> $PORTFORWARDLOG 2>&1 &

# MetricARK
kubectl port-forward --address 0.0.0.0 service/metricark -n nex-system 8282:80 \
>> $PORTFORWARDLOG 2>&1 &

tail -f $PORTFORWARDLOG
