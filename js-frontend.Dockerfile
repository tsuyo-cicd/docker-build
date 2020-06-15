FROM node:14-alpine3.10 

WORKDIR /tmp/ 

# ARG GIT_USER
# ARG GIT_TOKEN
ENV URL="localhost"

RUN apk update && apk add git 
# RUN git clone https://$GIT_USER:$GIT_TOKEN@github.com/tsuyo/k8s-app
RUN git clone https://github.com/tsuyo-cicd/js-frontend

WORKDIR /tmp/js-frontend

RUN npm i 
RUN npm run build 
RUN npm i -g serve 

# RUN cp updateAndRun.sh .
RUN chmod u+x updateAndRun.sh

EXPOSE 80 

ENTRYPOINT ["/bin/sh", "-c", "./updateAndRun.sh $URL"]
