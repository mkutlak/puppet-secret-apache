# Variables for provisioning
class gd_web::params {
  $apache_package_name    = 'httpd'
  $apache_service_name    = 'httpd'
  $apache_package_version = 'latest' # OR '2.4.37'
  $apache_conf_dir        = '/etc/httpd'
  $gd_doc_root            = '/var/www/html/gd'
  $user_name              = 'hunter2'
  $user_password          = 'hunter2' # *******
}
