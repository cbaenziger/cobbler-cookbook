require 'spec_helper'

describe_recipe 'cobblerd::default' do
  it { expect(chef_run).to include_recipe('apt::default') }
  it { expect(chef_run).not_to include_recipe('yum-epel::default') }
  it { expect(chef_run).to install_package('cobbler') }
  it { expect(chef_run).to enable_service('cobbler') }
  it { expect(chef_run).to start_service('cobbler') }
  it 'does not run cobbler sync' do
    cobbler_sync = chef_run.bash('cobbler-sync')
    expect(cobbler_sync.command).to match(/cobbler sync/)
    expect(cobbler_sync).to do_nothing()
  end
end
