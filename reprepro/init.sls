{% set repository_path = salt['pillar.get']('repository_path', '/var/www/reprepro') %}
{% set user = salt['pillar.get']('user', 'root') %}

reprepro_install:
  pkg.installed:
    - pkgs:
      - reprepro

reprepro_base_path:
  file.directory:
    - name: {{ repository_path }}
    - user: {{ user }}
    - group: {{ user }}
    - dirmode: 755
    - makedir: true
