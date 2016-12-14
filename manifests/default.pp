Package {
  allow_virtual => false,
}

package { "git":
  ensure => present,
}

host { "solrlocal":
  ip => "192.168.40.11",
}
