include:
  - elastic.install

# install marvel license:
#   cmd.run:
#     - name: /usr/share/elasticsearch/bin/plugin install license

install marvel agent:
  cmd.run:
    - name: /usr/share/elasticsearch/bin/plugin -i elasticsearch/marvel/latest

restart elastic search service:
  module.run:
    - name: service.restart
    - m_name: elasticsearch
  


    