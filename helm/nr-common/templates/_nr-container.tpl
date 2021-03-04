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
  volumeMounts:
   - name: nr-agent
     mountPath: /nr-agent
{{- end }}