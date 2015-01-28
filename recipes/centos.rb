#
# Cookbook Name:: cobblerd
# Recipe:: centos
#
# Copyright (C) 2014 Bloomberg Finance L.P.
#
include_recipe 'cobblerd::default'

profile = 'redhat'

cobbler_image 'centos-6.6-netinstall' do
  #source 'http://mirror.es.its.nyu.edu/centos/6/isos/x86_64/CentOS-6.6-x86_64-netinstall.iso'
  source 'http://10.0.2.2:8080/CentOS-6.6-x86_64-netinstall.iso'
  checksum 'ad8f6de098503174c7609d172679fa0dd276f4b669708933d9c4927bd3fe1017'
  os_breed 'redhat'
  os_version 'rhel6'
end

%w(centos-6.6-netinstall).each do |dist|
  cobbler_profile "#{profile}-#{dist}" do
    kickstart "#{profile}.ks"
    distro "#{dist}-x86_64"
  end
end
