reload () {
    namespace=$1
    deployment=$2

    kubectl patch -n ${namespace} deployment ${deployment} \
            -p "{\"spec\": {\"template\": {\"metadata\": {\"labels\": {\"date\": \"$(date +'%s')\" }}}}}"
}

reload panel e-ink-weather-panel-deployment
reload panel kindle-weather-panel-deployment
