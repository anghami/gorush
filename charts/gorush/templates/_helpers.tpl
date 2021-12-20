{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "gorush.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- $releases := .Release.Namespace | replace "jx-" "" |replace "anghami-" " " }}
{{- printf "%s-%s" $releases $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}