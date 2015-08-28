require 'spec_helper'

describe 'shoryuken' do

  describe file('/etc/sv/shoryuken') do
    it { should be_a_directory }
    it { should be_owned_by 'root' }
  end

  describe file('/etc/sv/shoryuken/run') do
    it { should be_a_file }
    it { should be_owned_by 'root' }
    its(:content) { should match %r(bundle exec shoryuken --daemon --rails --pidfile /var/run/shoryken.pid --logfile /var/log/shoryken.log) }
  end

  describe file('/etc/sv/shoryuken/env') do
    it { should be_a_directory }
    it { should be_owned_by 'root' }
  end

  describe file('/etc/sv/shoryuken/log') do
    it { should be_a_directory }
    it { should be_owned_by 'root' }
  end

  describe file('/etc/sv/shoryuken/log/main') do
    it { should be_a_directory }
    it { should be_owned_by 'root' }
  end

  describe file('/etc/sv/shoryuken/log/run') do
    it { should be_a_file }
    it { should be_owned_by 'root' }
  end

  describe file('/etc/sv/shoryuken/log/config') do
    it { should be_a_file }
    it { should be_owned_by 'root' }
  end

end
