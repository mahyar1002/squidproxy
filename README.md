# For creating passowrd with proxyuser username
htpasswd -c squid_passwd proxyuser


# Build and push on mac / Azure container registry
docker buildx build --platform linux/amd64 -t containerregistrymyer01.azurecr.io/squidproxy:latest .
TEST: docker run -p 3128:3128 containerregistrymyer01.azurecr.io/squidproxy:latest
TEST: curl -x http://localhost:3128 -U [user]:[pass] https://www.google.com/
az acr login --name containerregistrymyer01
docker push containerregistrymyer01.azurecr.io/squidproxy:latest


# Build and push on mac / Dockerhub registry
docker buildx build --platform linux/amd64 -t [dockerhub-username]/squidproxy:latest .
TEST: docker run -p 3128:3128 [dockerhub-username]/squidproxy:latest
TEST: curl -x http://localhost:3128 -U [user]:[pass] https://www.camros-tech.no/
docker login
docker push [dockerhub-username]/squidproxy:latest


# Test on production
curl -x [dns-name]:3128 -U [user]:[pass] https://www.google.com/
