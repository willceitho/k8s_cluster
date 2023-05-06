start:
	whoami

test_k8s:
	kubectl create ns lolkek --kubeconfig=/etc/kubernetes/admin.conf
	kubectl -n lolkek create deploy nginx --image nginx --kubeconfig=/etc/kubernetes/admin.conf
	kubectl -n lolkek expose deploy nginx --type NodePort --port 80 --kubeconfig=/etc/kubernetes/admin.conf
	kubectl -n lolkek get all
remove_test:
	kubectl delete ns lolkek 