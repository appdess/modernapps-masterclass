

kubectl edit configmap -n kube-system kube-proxy

and set:

apiVersion: kubeproxy.config.k8s.io/v1alpha1
kind: KubeProxyConfiguration
mode: "ipvs"
ipvs:
  strictARP: true

You can also add this configuration snippet to your kubeadm-config, just append it with --- after the main configuration.

Note, you don’t need this if you’re using kube-router as service-proxy because it is enabling strict arp by default.

Installation By Manifest
To install MetalLB, apply the manifest:

kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.9.3/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"


# Apply config
kubectl apply -f metallb-config.yaml