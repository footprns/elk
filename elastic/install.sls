# install java:
#   pkg.installed:
#     - name: java

# install elasticsearch:
#   pkg.installed:
#     - sources: 
#       - elasticsearch: https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.3.noarch.rpm

modify configuration file cluster name:
  file.line:
    - name: /etc/elasticsearch/elasticsearch.yml
    - match: cluster.name
    - mode: replace
    - content: 'cluster.name: myelk'
    - backup: True
modify configuration file node name:
  file.line:
    - name: /etc/elasticsearch/elasticsearch.yml
    - match: node.name
    - mode: replace
    - content: 'node.name: elastic01'
    - backup: True

modify configuration file network bind host:
  file.line:
    - name: /etc/elasticsearch/elasticsearch.yml
    - match: network.bind_host
    - mode: replace
    - content: 'network.bind_host: 10.0.0.4'
    - backup: True

change system memory:
  sysctl.present:
    - name: vm.max_map_count
    - value: 262144

start and enable elasticsearch service:
  service.running:
    - name: elasticsearch
    - enable: True