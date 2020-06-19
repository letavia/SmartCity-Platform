#!/bin/bash
kubectl exec -it heketi-ddf7b4bd8-n9ql8 -- heketi-cli volume delete $(echo $(kubectl get pv pvc-0a9bfe86-e3e6-11e9-bb59-42010a8000c4 -o jsonpath='{.spec.glusterfs.path}') | cut -c5-) --user admin --secret admin
kubectl delete pv pvc-0a9bfe86-e3e6-11e9-bb59-42010a8000c4 
