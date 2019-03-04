FROM busybox

RUN mkdir /opt
ADD http://central.maven.org/maven2/com/newrelic/agent/java/newrelic-java/4.7.0/newrelic-java-4.7.0.zip /tmp/newrelic.zip
RUN unzip /tmp/newrelic.zip -d /opt/ && rm /tmp/newrelic.zip
RUN mkdir -p /opt/newrelic/logs
RUN chmod 777 /opt/newrelic/logs

ENTRYPOINT ["sh", "-c", "#!/bin/sh\nwhile [ true ]\ndo\n  sleep 1000\ndone"]