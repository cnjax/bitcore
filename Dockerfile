FROM centos:7
MAINTAINER cnjax <nightcat@gmail.com>
RUN yum -y update && yum clean all
RUN yum -y --setopt=tsflags=nodocs groupinstall "Development Tools"  && \
    yum -y --setopt=tsflags=nodocs install git bzip2 && \
    yum clean all
RUN curl -sL https://rpm.nodesource.com/setup_8.x | bash -  && yum -y install nodejs && \
    yum clean all
WORKDIR /usr/src/app
RUN git clone https://github.com/bitpay/bitcore.git .
RUN rm -rf node_modules package-lock.json && npm install --unsafe-perm=true --no-shrinkwrap
 
EXPOSE 3000
EXPOSE 8100
#CMD ["./node_modules/.bin/lerna", "run", "start"]
#CMD ["npm", "--prefix=./packages/bitcore-node", "start"]
#CMD ["npm", "--prefix=./packages/insight", "start"]
CMD ["npm", "run","node"]
