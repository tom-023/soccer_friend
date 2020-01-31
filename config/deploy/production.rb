server '52.193.15.251',user: 'appwata', roles: %w{app db web}
set :ssh_options, keys: '/Users/watanabeatsushi/.ssh/id_rsa'

# server '52.193.15.251',
#       user: 'appwata',
#       roles: %w{app db web},
#       ssh_options: {
#           port: 22,
#           user: "appwata",
#           keys: '/Users/watanabeatsushi/.ssh/id_rsa',
#           forward_agent: true
#       }