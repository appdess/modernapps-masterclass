# First connect sshuttle to machine:
sshuttle -r vmware@3.121.122.0:1111 192.168.2.0/24

# Browser Tabs VMC:
https://vmc.vmware.com/

# Open SSHUTTLE + seperate window
folder:
/Users/adess/git/tkg-vmc/demo



# show currently deployed clusters
tkg get cluster management-cluster

# Create a TKG-Cluster
tkg create cluster  techsummit$RANDOM --plan=dev --kubernetes-version=v1.17.3+vmware.1

# deploy rocketchat demo IDEE: 
# Expose publicly and allow everybody to chat! http://192.168.2.4/direct/rocket.cat
# URL: http://chat.alexdess.cloud/home user: vmware pw:
helm install rocketchat stable/rocketchat --set persistence.StorageClass=standard,mongodb.mongodbPassword=password,mongodb.mongodbRootPassword=password,service.type=LoadBalancer


# Show Storage integration
k describe sc standard
k apply -f pvc.yaml
k get pvc -n techsummit

# Set-Context Back:
k config use-context adess-admin@adess
kubectl config use-context alex2-admin@alex2

# Cleanup
k delete ns techsummit