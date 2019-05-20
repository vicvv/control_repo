class profile::ssh_server {
  package {'openssh-server':
    ensure => present,
  }
  service { 'sshd':
    ensure => 'running',
    enable => 'true',
  }
  ssh_authorized_key { 'root@master.puppet.vm':
    ensure => present,
    user   => 'root',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDYLZbGijtDtLvZ8iwid2BhfHKgvmpTntRupsSrxTU3HBMGibFmM8nJ6A4idrilSXB7h+UJwLC+NzstmiCaJsebWp/htYu+IXwGNYAz9P0r+Oj23iAeFmy0tn+GLGhdXrIFRvgMoN29/aKq7WOce8i1p358T27i/otHo/ln3XoiQi19hZiRoa6p5+Re0bnuoTxFBC6t1mjkGF6Rzd1683HDNp8h7GG8aczLJjce3FMHVO147zM7Vb2bwdnz1nZgzRTQL7VHCMB6yVeTXVTo5F7mCl4H3nnJAz5cLBVeex3I6O+Jgs3OLqmBIA3PuQCaXrH13m9/p0PQtyi/zqIXMDPN',
  }  
}
