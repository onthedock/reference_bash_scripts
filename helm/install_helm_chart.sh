function install_helm_chart {
    helmChart="$1"
    helmRepoChart="$2"
    chartNamespace="$3"

    checkRelease=$(helm status $helmChart --namespace $chartNamespace 2>/dev/null| grep -i status | awk '{ print $2 }')

    if [ "$checkRelease" != "deployed" ]
    then
        echo "...Installing longhorn"
        helm install $helmChart $helmRepoChart --namespace $chartNamespace --create-namespace
    else
        echo "... $helmChart is already installed in the namespace $chartNamespace"
    fi
}