
default['ubuntu']['package_mirror_url'] = 'http://mirror.pnl.gov/ubuntu/'

default['kibana']['install_type'] = 'file'
default['kibana']['version'] = '4.2.1-linux-x64'

# Values to use for git method of installation
default['kibana']['git']['url'] = 'https://github.com/elasticsearch/kibana'
default['kibana']['git']['branch'] = 'v3.1.2'
default['kibana']['git']['type'] = 'sync' # checkout | sync
default['kibana']['git']['config'] = 'kibana/config.js' # relative path of config file
default['kibana']['git']['config_template'] = 'config.js.erb' # template to use for config
default['kibana']['git']['config_template_cookbook'] = 'kibana_lwrp' # cookbook containing config template

default['kibana']['file']['type'] = 'tgz'
default['kibana']['file']['url'] = nil # calculated based on version, unless you override this
default['kibana']['file']['checksum'] = nil # sha256 ( shasum -a 256 FILENAME )
default['kibana']['file']['config'] = 'config/kibana.yml' # relative path of config file
default['kibana']['file']['config_template'] = 'kibana.yml.erb' # template to use for config
default['kibana']['file']['config_template_cookbook'] = 'kibana_lwrp' # cookbook containing config template

default['kibana']['install_path'] = '/opt'


# Kibana Java Web Server
default['kibana']['java_webserver_port'] = 5601
default['kibana']['install_java'] = true

# used to configure proxy information for the webserver to proxy ES calls.
default['kibana']['es_server'] = '127.0.0.1'
default['kibana']['es_port'] = '9200'
default['kibana']['es_role'] = 'elasticsearch_server'
default['kibana']['es_scheme'] = 'http://'

# user to install kibana files as.  if left blank will use the default webserver user.
default['kibana']['user'] = 'kibana'

# config template location and variables.
default['kibana']['config']['kibana_index']  = 'kibana-int'
default['kibana']['config']['panel_names']   = %w(histogram map pie table filtering timepicker text fields hits dashcontrol column derivequeries trends bettermap query terms)
default['kibana']['config']['default_route'] = '/dashboard/file/logstash.json'
default['kibana']['config']['default_app_id'] = 'discover'
# include quote inside this next variable if not using window.location style variables...
# e.g.  = "'http://elasticsearch.example.com:9200'"
default['kibana']['config']['elasticsearch'] = 'window.location.protocol+"//"+window.location.hostname+":"+window.location.port'

# nginx variables
default['kibana']['nginx']['install_method'] = 'package'
default['kibana']['nginx']['template'] = 'kibana-nginx.conf.erb'
default['kibana']['nginx']['template_cookbook'] = 'kibana_lwrp'
default['kibana']['nginx']['enable_default_site'] = false
default['kibana']['nginx']['install_method'] = 'package'

# Apache variables.
default['kibana']['apache']['template'] = 'kibana-apache.conf.erb'
default['kibana']['apache']['template_cookbook'] = 'kibana_lwrp'
default['kibana']['apache']['enable_default_site'] = false