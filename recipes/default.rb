include_recipe "runit"
command = "chpst"
command += " -u #{node[:shoryuken][:user]} " if node[:shoryuken][:user]
command += " -/ #{node[:shoryuken][:app_dir]} " if node[:shoryuken][:app_dir]
command += " bunde exec" if node[:shoryuken][:bundle_exec]
command += " shoryuken --daemon"
command += " --verbose" if node[:shoryuken][:verbose]
command += " --rails" if node[:shoryuken][:rails]
command += " --pidfile #{node[:shoryuken][:pidfile]}" if node[:shoryuken][:pidfile]
command += " --logfile #{node[:shoryuken][:logfile]}" if node[:shoryuken][:logfile]
command += " --config #{node[:shoryuken][:config]}" if node[:shoryuken][:config]
command += " --concurrency #{node[:shoryuken][:concurrency]}" if node[:shoryuken][:concurrency]
command += " --require #{node[:shoryuken][:require]}" if node[:shoryuken][:require]

runit_service "shoryuken" do
  action node[:shoryuken][:service_action]
  options(:command => command)
end
