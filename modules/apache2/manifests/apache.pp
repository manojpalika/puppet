class apache::apache {
        notify { "Apache Install": }


        package {
           apache2:
                ensure => installed;
        }

        service{
           'apache2':
                ensure     => running,
                hasstatus  => true,
                hasrestart => true,
                enable     => true,
        }

        file {
           '/etc/logrotate.d/apache2':
                ensure  => file,
                owner  => root,
                group  => root,
                mode   => 644,
                source  => 'puppet:///modules/apache2/apache/apache2-logrotate';

           '/etc/apache2/mods-available/status.conf':
                ensure  => file,
                owner  => root,
                group  => root,
                mode   => 644,
                require => Package[$hockeyapache],
                source  => 'puppet:///modules/apache2/hockey/apache2-status';
        }
}

