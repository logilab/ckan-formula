{% from "ckan/map.jinja" import ckan with context %}

include:
  - ckan.install
  - solr

solr-schema:
  file.copy:
    - source: {{ ckan.src_dir }}/ckan/ckan/config/solr/schema.xml
    {% if grains['os_family'] == 'Debian' %}
    - name: /usr/share/solr/conf/schema.xml
    - watch_in:
      - service: solr
    {% elif grains['os_family'] == 'RedHat' %}
    - name: {{ ckan.solr_home }}/collection1/conf/schema.xml
    - user: tomcat
    - group: tomcat
    {% endif %}
    - force: True
    - makedirs: True
    - require:
      - git: ckan-src
      {% if grains['os_family'] == 'Debian' %}
      - pkg: solr
      {% endif %}

{% if grains['os_family'] == 'Debian' %}
/etc/default/jetty8:
  file.append:
    - text: JETTY_PORT=8983
    - require:
      - pkg: solr
{% endif %}
