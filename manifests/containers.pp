class classroom::containers {
  # Add parameter to allow registry without SSL
  class {'docker':
    extra_parameters => '--insecure-registry master.puppetlabs.vm:5000',
    before           => Class['dockeragent']
  }

  class { 'dockeragent':
    registry => 'master.puppetlabs.vm:5000',
  }

  dockeragent::node { "agent1.${::fqdn}":
    ports => ['10080:80'],
  }
  dockeragent::node { "agent2.${::fqdn}":
    ports => ['20080:80'],
  }
}
