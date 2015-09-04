include_recipe "runit"

(0...node[:shoryuken][:number_of_processes]).each do |service_id|
  command = "chpst"
  command += " -u #{node[:shoryuken][:user]} " if node[:shoryuken][:user]
  command += " -e /etc/sv/shoryuken-#{service_id}/env" if node[:shoryuken][:environment_variables]
  command += " bundle exec" if node[:shoryuken][:bundle_exec]
  command += " shoryuken"
  command += " --verbose" if node[:shoryuken][:verbose]
  command += " --rails" if node[:shoryuken][:rails]
  command += " --pidfile #{node[:shoryuken][:pidsdir]}/shoryuken-#{service_id}.pid" if node[:shoryuken][:pidsdir]
  command += " --logfile #{node[:shoryuken][:logfile]}" if node[:shoryuken][:logfile]
  command += " --config #{node[:shoryuken][:config]}" if node[:shoryuken][:config]
  command += " --concurrency #{node[:shoryuken][:concurrency]}" if node[:shoryuken][:concurrency]
  command += " --require #{node[:shoryuken][:require]}" if node[:shoryuken][:require]

  runit_service "shoryuken-#{service_id}" do
    action node[:shoryuken][:service_action]
    options(:command => command, :app_dir => node[:shoryuken][:app_dir])
    env node[:shoryuken][:environment_variables]
    sv_timeout node[:shoryuken][:service_timeout]
    run_template_name "shoryuken"
    log_template_name "shoryuken"
  end
end
