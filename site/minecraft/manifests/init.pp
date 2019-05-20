class minecraft (
  $url = 'https://launcher.mojang.com/v1/objects/886945bfb2b978778c3a0288fd7fab09d315b25f/server.jar',
  $install_dir = '/opt/minecraft'
)

{
file {$install_dir:
  ensure => directory,
 }
 file { "${install_dir}/minecraft_server.jar":
    ensure => file,
    source => $url,
    before => Service['minecraft'],
   }
  package {'java':
    ensure => present,
    }
  file {"${install_dir}/eula.txt":
    ensure => file,
    content => 'eula=true'
    }
  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    content => epp('minecraft/minecraft.service.epp', {
      install_dir => $install_dir,
    }),
  }
    
   service { 'minecraft':
    ensure => running,
    enable => true,
    require => [Package['java'], File["${install_dir}/minecraft_server.jar"], File["${install_dir}/eula.txt"]],
    }
 }
    
