#
# Cookbook Name:: mycookbook
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

kibana_user 'kibana' do
  name 'kibana'
  group 'kibana'
  home '/opt/kibana'
end

kibana_install 'file' do
  name 'web'
  user 'kibana'
  group 'kibana'
  install_dir '/opt/kibana'
  install_type 'file'
end

kibana_web 'kibana_file' do
  type 'apache'
  listen_port '8080'
end
