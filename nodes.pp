#
# nodes.pp - defines all puppet nodes
#

# self-manage the puppet master server
node 'puppet' { 
  include puppetrun
  class { 'helloworld': }
  
}


##### CLIENTS

node 'client1' {
  include puppetrun
  class { 'helloworld': }
}

node 'client2' { 
  include puppetrun
  class { 'helloworld': }
}
