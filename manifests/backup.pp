node default {
  include pi::profiles::tiny
  include baseline::update
  include baseline::celestial
  include backup::rclone
  class {'shell':
    include => false
  }

  class{ 'shell::tmux':
    tmuxinator => false,
    conffile   => '.tmux.conf'
  }
}
