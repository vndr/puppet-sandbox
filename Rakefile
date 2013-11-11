SSH = 'vagrant ssh'
desc "Run Puppet on ENV['CLIENT']"
task :apply do
  client = ENV['CLIENT']
  sh "#{SSH} #{client} -c 'pull-updates'"
end

desc "Add syntax check hook to your git repo"
task :add_check do
here = File.dirname(__FILE__)
sh "ln -s #{here}/hooks/check_syntax.sh #{here}/.git/hooks/pre-commit"
puts "Puppet syntax check hook added"
end