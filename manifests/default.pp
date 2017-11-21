package {
  'httpd':
    ensure  => installed,
    before  => File['httpd_config'];
}
file {
  'httpd_config':
    notify  =>  Service['httpd'],
    path    =>  '/etc/httpd/conf.d/site.conf',
    ensure  =>  file,
    group   =>  'root',
    owner   =>  'root',
    replace =>  'true',
    require =>  Package['httpd'],
    content =>  template('/etc/setup-files/templates/httpd/site.conf.erb');
  'index.html':
    path    =>  '/var/www/html/index.html',
    ensure  =>  file,
    group   =>  'root',
    owner   =>  'root',
    replace =>  'true',
    require =>  Package['httpd'],
    source  =>  '/etc/setup-files/files/html/index.html';
  'puppet-cron':
    path    =>  '/etc/cron.d/puppet',
    ensure  =>  file,
    group   =>  'root',
    owner   =>  'root',
    replace =>  'true',
    source  =>  '/etc/setup-files/files/cron.d/puppet';
  'logrotate-httpd':
    path    =>  '/etc/logrotate.d/httpd',
    ensure  =>  file,
    group   =>  'root',
    owner   =>  'root',
    replace =>  'true',
    content  =>  '/etc/setup-files/templates/logrotate.d/httpd.erb';
}
service {
  'httpd':
    ensure  =>  'running',
    enable  =>  true,
    require =>  [
        Package['httpd'],
    ];
}
