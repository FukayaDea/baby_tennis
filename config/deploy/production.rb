

 server "150.95.204.25", user: "fukaya", group: "wheel", roles: %w{app db web}, port: 57926




  set :ssh_options, {
    keys: %w(~/.ssh/id_rsa),
    forward_agent: true,
    auth_methods: %w(publickey)
  }

