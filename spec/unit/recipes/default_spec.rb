#
# Cookbook:: node_3
# Spec:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'node_3::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '16.04'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'Should install nginx' do
      expect(chef_run).to install_package 'nginx'
    end

    it 'Should enables nginx' do
      expect(chef_run).to enable_service 'nginx'
      end

    it 'Should start the nginx service' do
      expect(chef_run).to start_service 'nginx'

    end


    # it 'Should install nodejs from a recipe' do
    #   expect(chef_run).to include_recipe 'nodejs'
    # end
    #
    # it 'Should install pm2 via npm' do
    #   expect(chef_run).to install_nodejs_npm 'pm2'
    # end

    it 'Should create proxy.conf template in /etc/nginx/sites-available' do
      expect(chef_run).to create_template "/etc/nginx/sites-available/proxy.conf"
    end

    it 'Should link sites-available to sites-enabled ' do
      expect(chef_run).to create_link "/etc/nginx/sites-enabled/proxy.conf"
    end

    it 'Should delete the symlink from the default config' do
      expect(chef_run).to delete_link "/etc/nginx/sites-enabled/default"
    end

    it 'Runs update apt-get update' do
      expect(chef_run).to update_apt_update 'update_sources'
    end

    it 'Should create proxy.conf template in /etc/nginx/sites-available with port 3000' do
      expect(chef_run).to create_template("/etc/nginx/sites-available/proxy.conf")
      # with_variables(proxy_port: 3000)
    end
  end
end
