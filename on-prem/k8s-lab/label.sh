kubectl get pod --show-labels -o wide
kubectl get pod -l app=nginx-prod,env=prod