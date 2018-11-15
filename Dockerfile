FROM centos:7

LABEL maintainer="Miguel Ángel García <miguel@adobe.com>"

RUN yum update -y && yum install -y \
	git \
	wget \
    ruby \
	&& yum clean -y all \
    && rm -rf /var/cache/yum
	
RUN gem install puppet-lint
RUN gem install puppet -v '< 4'
RUN puppet module install puppetlabs-concat

WORKDIR /root
RUN mkdir /root/puppet

COPY entrypoint.sh /root/entrypoint.sh

RUN chmod +x entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]