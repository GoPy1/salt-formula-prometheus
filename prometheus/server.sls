{% from "prometheus/map.jinja" import server with context %}
{%- if server.enabled %}

{%- if pillar.docker.host is defined %}

{{server.dir.config}}/prometheus.yml:
  file.managed:
  - source: salt://prometheus/files/prometheus.yml
  - template: jinja

{{server.dir.config}}/alerts.yml:
  file.managed:
  - source: salt://prometheus/files/alerts.yml
  - template: jinja

{%- endif %}
{%- endif %}
