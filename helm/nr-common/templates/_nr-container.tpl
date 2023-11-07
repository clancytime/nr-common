{{- define "nr.container" -}}
initContainers:
- name: nr-busybox
  image: {{ .Values.nrImagePrefix | default "shanesol" }}/nr-busybox:{{ .Values.nrVersion | default "4.7.0" }}
  command:
    - "sh"
    - "-c"
    - |+
      #!/bin/sh
      # need to check if nr already installed on emptyDir and this is running again from restart
      if [ "$(find /nr-agent -mindepth 1 -print -quit 2>/dev/null)" ]
      then
        echo "new relic agent already installed"
      else
        mv /opt/newrelic /nr-agent
      fi

      {{- if eq .Values.coroutines.enabled true }}
      cd /nr-agent
      mkdir extensions || true
      cd extensions
      wget https://github.com/newrelic/newrelic-java-kotlin-coroutines/releases/download/1.3/Kotlin-Coroutines_1.0.jar
      wget https://github.com/newrelic/newrelic-java-kotlin-coroutines/releases/download/1.3/Kotlin-Coroutines_1.1.jar
      wget https://github.com/newrelic/newrelic-java-kotlin-coroutines/releases/download/1.3/Kotlin-Coroutines_1.2.jar
      wget https://github.com/newrelic/newrelic-java-kotlin-coroutines/releases/download/1.3/Kotlin-Coroutines_1.4.jar
      {{- end }}
  volumeMounts:
   - name: nr-agent
     mountPath: /nr-agent
{{- end }}