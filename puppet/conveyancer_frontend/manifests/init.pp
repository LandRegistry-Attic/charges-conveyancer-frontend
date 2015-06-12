# Install and configure the Charges Conveyancer Frontend
class conveyancer_frontend (
    $port = '9100',
    $host = '0.0.0.0',
    $branch_or_revision = 'master',
    $source = 'git://github.com/LandRegistry/charges-conveyancer-frontend',
    $owner = 'vagrant',
    $group = 'vagrant',
    $case_api_address = 'http://localhost:9015'
) {
  require ::standard_env

  vcsrepo { '/opt/conveyancer-frontend':
    ensure   => latest,
    provider => git,
    source   => 'git://github.com/LandRegistry/charges-conveyancer-frontend',
    revision => $branch_or_revision,
    owner    => $owner,
    group    => $group,
    notify   => Service['conveyancer_frontend'],
  }
  file { '/opt/conveyancer-frontend/bin/run.sh':
    ensure  => 'file',
    mode    => '0755',
    owner   => $owner,
    group   => $group,
    source  => "puppet:///modules/${module_name}/run.sh",
    require => Vcsrepo['/opt/conveyancer-frontend'],
    notify  => Service['conveyancer_frontend'],
  }
  file { '/etc/nginx/conf.d/conveyancer_frontend.conf':
    ensure  => 'file',
    mode    => '0755',
    content => template("${module_name}/nginx.conf.erb"),
    owner   => $owner,
    group   => $group,
    notify  => Service['nginx'],
  }
  file { '/etc/init.d/conveyancer_frontend':
    ensure => 'file',
    mode   => '0755',
    owner  => $owner,
    group  => $group,
    source => "puppet:///modules/${module_name}/conveyancer_frontend.initd",
  }
  file { '/etc/systemd/system/conveyancer_frontend.service':
    ensure  => 'file',
    mode    => '0755',
    owner   => $owner,
    group   => $group,
    content => template("${module_name}/conveyancer_frontend_service.erb"),
    notify  => [Exec['systemctl-daemon-reload'], Service['conveyancer_frontend']],
  }
  service { $module_name:
    ensure   => 'running',
    enable   => true,
    provider => 'systemd',
    require  => [
      Vcsrepo["/opt/${module_name}"],
      File["/opt/${module_name}/bin/run.sh"],
      File["/etc/init.d/${module_name}"],
      File["/etc/systemd/system/${module_name}.service"],
      File["/var/run/${module_name}"],
    ],
  }
}