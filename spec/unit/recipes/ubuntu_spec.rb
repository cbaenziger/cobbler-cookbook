require 'spec_helper'

describe_recipe 'cobblerd::ubuntu' do
  before(:each) do
    stub_command("cobbler profile find --name='ubuntu-ubuntu-12.04-minimal' --distro='ubuntu-12.04-minimal-x86_64'|grep -q '^ubuntu-ubuntu-12.04-minimal$'").and_return(1)
    stub_command("cobbler profile find --name='ubuntu-ubuntu-14.04-minimal' --distro='ubuntu-14.04-minimal-x86_64'|grep -q '^ubuntu-ubuntu-14.04-minimal$'").and_return(0) 
  end

  it { expect(chef_run).to include_recipe('cobblerd::default') }

  it 'downloads image ISO' do
    expect(chef_run).to create_remote_file("#{chef_run.file_cache_path}/ubuntu-14.04-minimal.iso")
  end

  it 'creates the ubuntu 12.04 minimal cobbler image' do
    expect(chef_run).to import_image('ubuntu-12.04-minimal')
  end

  it 'downloads image ISO' do
    expect(chef_run).to create_remote_file("#{chef_run.file_cache_path}/ubuntu-12.04-minimal.iso")
  end

#  it 'steps into cobbler_import the ubuntu 12.04 minimal cobbler image' do
#    expect(chef_run).to create_directory("#{Chef::Config[:file_cache_path]}/mnt")
#  end

#  it 'steps into cobbler_import the ubuntu 12.04 minimal cobbler image' do
#    expect(chef_run).to mount_mount('image').with_mount_point("#{Chef::Config[:file_cache_path]}/mnt")
#  end

#  it 'executes cobbler sync' do
#    expect(chef_run).to run_bash('cobbler-sync').with_command('cobbler sync')
#  end

#  it 'creates the ubuntu 14.04 minimal cobbler image' do
#    expect(chef_run).to import_image('ubuntu-14.04-minimal')
#  end
end
