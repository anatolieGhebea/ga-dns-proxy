# ga-dns-proxy
Basic configuration for an Nginx proxy (Docker) container to allow high portability of the setup in case of VPS provider change.

# Pre-requisites

Before continuing make sure that Docker and Docker-compose are installed on the VPS server. 
Create an docker network to allow the containers to communicate with each other.
`docker network create proxynetwork`

# Deploy 

On the VPS server create a common directory to hold all the applications running on the server that are managed via git and docker containers. 
Such a setup allows for an easy separation between the bear metal vps and the applications running on it. 

## Steps

Move to the home directory `cd ~/` and create the apps directory with `makedir apps` then move to the apps directory `cd apps`.

This proxy setup is set to be considered as an application, so in the apps directory clone the repository with git clone. 
`git clone git@github.com:anatolieGhebea/ga-dns-proxy.git` 
 
In this folder location you can clone as many repositories as you want, each repository will be considered as an application. Each application must contain its own docker-compose.yml file in order to be able to run them. The proxy container is intended to do just that, to proxy the requests to the applications running on the server. 
Additionally, it is possible to manage the ssl configuration and ssl certificate generation via Let's Encrypt via the proxy cotainer. 

Enter the app folder, `cd ga-dns-proxy`  and create the .env file by copying the .env.example file `cp .env.example .env`. Adjust the parameters in the .env file to match the desired configuration. 
Run the docker-compose up command to start the proxy container `docker-compose up -d`.

Proxy should be good to up and running.

## Adding an application 

In the `~/apps/ga-dns-proxy/nginx/conf.d` directory create a new file with the desired app configuration and restart the proxy container.

# NOTE 

If applications are hosted on the same server, manage the `network` definition off all applications via the .env file in order to allow the proxy container to communicate with the applications.