#
# nodes.pp - defines all puppet nodes
#

# self-manage the puppet master server
node 'puppet' {
  include git 
  include puppetrun
  class { 'helloworld': }
  
}


##### CLIENTS

node 'client1' {
  include git
  include puppetrun
  class { 'helloworld': }
}

node 'client2' {
  include git 
  include puppetrun
  class { 'helloworld': }
}
