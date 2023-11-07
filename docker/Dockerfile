FROM busybox

RUN mkdir /opt
ADD https://download.newrelic.com/newrelic/java-agent/newrelic-agent/7.11.1/newrelic-java-7.11.1.zip /tmp/newrelic.zip
RUN unzip /tmp/newrelic.zip -d /opt/ && rm /tmp/newrelic.zip
RUN mkdir -p /opt/newrelic/logs
RUN chmod 777 /opt/newrelic/logs

ENTRYPOINT ["sh", "-c", "#!/bin/sh\nwhile [ true ]\ndo\n  sleep 1000\ndone"]