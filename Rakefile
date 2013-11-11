SSH = 'vagrant ssh'
desc "Run Puppet on ENV['CLIENT']"
task :apply do
  client = ENV['CLIENT']
  sh "#{SSH} #{client} -c 'pull-updates'"
end