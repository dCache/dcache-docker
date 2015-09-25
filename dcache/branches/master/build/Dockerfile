FROM dcache/deps:master
MAINTAINER dCache "https://www.dcache.org"

RUN groupadd -r dcache && useradd -r -g dcache dcache

RUN git clone https://github.com/dCache/dcache.git

RUN cd dcache && mvn -am -pl packages/fhs package -P deb -DskipTests 

RUN dpkg -i /dcache/packages/fhs/target/dcache_*all.deb

RUN rm -rf /dcache
RUN rm -rf /root/.m2
