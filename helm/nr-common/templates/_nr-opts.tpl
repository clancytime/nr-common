{{- define "nr.opts" -}}-javaagent:/nr-agent/newrelic/newrelic.jar -Dnewrelic.config.file=/etc/config/newrelic/newrelic.yml{{- end }}