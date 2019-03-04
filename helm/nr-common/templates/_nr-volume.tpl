{{- define "nr.volume" -}}
- name: new-relic-config
  configMap:
    name: {{ .Values.global.name }}-nr-config
- name: nr-agent
  emptyDir: {}
{{- end }}
{{- define "nr.mount" -}}
- name: new-relic-config
  mountPath: /etc/config/newrelic
- name: nr-agent
  mountPath: /nr-agent
{{- end }}