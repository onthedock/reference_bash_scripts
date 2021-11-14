function set_default_storageclass {
    defaultStorageClass="$1"
    storageClassList=$(kubectl get storageclass -o name | awk -F '/' '{print $2}')

    for storageclass in $storageClassList
    do
        if [ "$storageclass" = "$defaultStorageClass" ]
        then
            echo "Set default storageClass for $storageclass"
            kubectl patch storageclass $storageclass -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
        else
            echo "Removing default storageClass for $storageclass"
            kubectl patch storageclass $storageclass -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"false"}}}'
        fi
    done
}