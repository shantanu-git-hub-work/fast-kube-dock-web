## kubernetes minikube

    install kubectl and minikube on ubuntu
    create a folder named docker-zone in /usr called docker-zone and projects inside it
    change permission/owner of docker-zone folder to 777

#### copy all project files to /usr/docker-zone/projects

    ### in powershell not ssh use scp
        scp -r "e:\python\fast-web-app\kube" "user@<ip-address>:<home/usr>/docker-zone/projects
        scp "e:\python\fast-web-app\main.py" "user@<ip-address>:<home/usr>/docker-zone/projects
        scp "e:\python\fast-web-app\requirements.txt" "user@<ip-address>:<home/usr>/docker-zone/projects
        scp "e:\python\fast-web-app\Dockerfile" "user@<ip-address>:<home/usr>/docker-zone/projects

#### build docker image

    #### in project root dir
        1. docker build -t fast-web-app .
        2. this will create a docker image named fast-web-app
        3. check docker image by running it
           docker run -d --name fast-web-app -p 8000:8000 fast-web-app:latest 

#### load docker image to minikube

    1.start minikube
    2.check all nodes,pods,services, deployments for default namespace using ...
    """ kubectl get pods,nodes,deployments, services -A"""
    3.minikube load docker-image fast-web-app:latest
    4.go to in kube folder, which has .yml files
    5.kubectl apply -f deployment.yml, service.yml
    6.check all nodes,pods,services, deployments for default namespace if service is running
    and minikube has created two pods for fast-web-app.

#### open port 8000 on box using sudo ufw allow 8000/tcp

#### run minikube service fast-web-app --url

    minikube service fast-web-app --url

#### open browser and go to url

    ### http://<localhost>:<port>

#### use ip address of minikube box to access remotely

    ### http://<remote-ip>:<port>