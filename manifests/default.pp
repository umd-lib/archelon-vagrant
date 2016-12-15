Package {
  allow_virtual => false,
}

package { "httpd":
  ensure => present,
}
package { "mod_ssl":
  ensure => present,
}
package { "epel-release":
  ensure => present,
}
package { "git":
  ensure => present,
}
package { "nodejs":
  ensure  => present,
  require => Package["epel-release"],
}
package { "npm":
  ensure  => present,
  require => Package["epel-release"],
}

host { "solrlocal":
  ip => "192.168.40.11",
}
