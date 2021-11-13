function getKubeconfig {
    scriptDir="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
    if test -f "kubeconfig"
    then
        echo "Using $scriptDir/kubeconfig"
        export KUBECONFIG=$scriptDir/kubeconfig
    elif test -f $HOME/.kube/config
    then
        echo "Using default kubeconfig at $HOME/.kube/config"
    elif [[ -z "$KUBECONFIG" ]]
    then
        echo "ERROR - Unable to find a valid kubeconfig"
        exit 1
    else
        echo "Using \$KUBECONFIG=$KUBECONFIG"
    fi
}
