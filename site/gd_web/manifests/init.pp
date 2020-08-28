# Install and configure Apache2 
# User-Pass protected website
class gd_web (
  $apache_package_name    = $gd_web::params::apache_package_name,
  $apache_package_version = $gd_web::params::apache_package_version,
  $apache_service_name    = $gd_web::params::apache_service_name,
  $apache_conf_dir        = $gd_web::params::apache_conf_dir,
  $gd_doc_root            = $gd_web::params::gd_doc_root,
  $user_name              = $gd_web::params::user_name,
  $user_password          = $gd_web::params::user_password,
) inherits gd_web::params {
  # install httpd
  package { $apache_package_name:
    ensure => $apache_package_version,
    before => [
      File[$gd_doc_root],
      File["${apache_conf_dir}/conf.d/gd.conf"],
      Exec['generate htpasswd']
    ]
  }

  # create htpasswd passwordfile
  exec { 'generate htpasswd':
    command => "/usr/bin/htpasswd -c -b ${apache_conf_dir}/.htpasswd ${user_name} ${user_password}",
    creates => "${apache_conf_dir}/.htpasswd",
    user    => 'root',
  }

  # create directory for web
  file { $gd_doc_root:
    ensure => 'directory',
    source => 'puppet:///modules/gd_web/gd',
    recurse => 'remote',
    owner  => 'root',
    group  => 'root'
  }

  # copy-in httpd config gd.conf
  file { "${apache_conf_dir}/conf.d/gd.conf":
    ensure  => 'file',
    content => epp('gd_web/gd.conf.epp', { 'doc_root' => $gd_doc_root }),
    owner   => 'root',
    group   => 'root',
    mode    => '0644'
  }

  # enable and start httpd
  service { $apache_service_name:
    ensure    => running,
    enable    => true,
    subscribe => [
      File["${apache_conf_dir}/conf.d/gd.conf"],
    ]
  }

}
