

 server "163.44.169.39", user: "gattsu", group: "wheel", roles: %w{app db web}, port: 62958




  set :ssh_options, {
    keys: %w(~/.ssh/id_rsa),
    forward_agent: true,
    auth_methods: %w(publickey)
  }