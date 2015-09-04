require 'spec_helper'

describe 'shoryuken' do

  (0...2).each do |service_id|
    describe file("/etc/sv/shoryuken-#{service_id}") do
      it { should be_a_directory }
      it { should be_owned_by 'root' }
    end

    describe file("/etc/sv/shoryuken-#{service_id}/run") do
      it { should be_a_file }
      it { should be_owned_by 'root' }
      its(:content) { should match %r(bundle exec shoryuken --rails --pidfile tmp/pids/shoryuken-#{service_id}.pid --logfile log/shoryuken.log) }
      its(:content) { should match %r(APP_ROOT=/srv/www/myapp/current) }
    end

    describe file("/etc/sv/shoryuken-#{service_id}/env") do
      it { should be_a_directory }
      it { should be_owned_by 'root' }
    end

    describe file("/etc/sv/shoryuken-#{service_id}/env/DERP") do
      it { should be_a_file }
      it { should be_owned_by 'root' }
      its(:content) { should match 'herp' }
    end

    describe file("/etc/sv/shoryuken-#{service_id}/log") do
      it { should be_a_directory }
      it { should be_owned_by 'root' }
    end

    describe file("/etc/sv/shoryuken-#{service_id}/log/main") do
      it { should be_a_directory }
      it { should be_owned_by 'root' }
    end

    describe file("/etc/sv/shoryuken-#{service_id}/log/run") do
      it { should be_a_file }
      it { should be_owned_by 'root' }
    end

    describe file("/etc/sv/shoryuken-#{service_id}/log/config") do
      it { should be_a_file }
      it { should be_owned_by 'root' }
    end
  end
end
