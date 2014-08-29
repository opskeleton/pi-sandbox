# Leaner sysloging
class pi::syslog {
  package{'rsyslog':
    ensure  => absent
  }

  package{'inetutils-syslogd':
    ensure  => present
  }

  # Clear old logs
  # for file in /var/log/*.log /var/log/mail.* /var/log/debug /var/log/syslog; do [ -f "$file" ] && rm -f "$file"; done
  # for dir in fsck news; do [ -d "/var/log/$dir" ] && rm -rf "/var/log/$dir"; done

  # New configuration
  # echo -e "*.*;mail.none;cron.none\t -/var/log/messages\ncron.*\t -/var/log/cron\nmail.*\t -/var/log/mail" > /etc/syslog.conf

  # logrotate
  # mkdir -p /etc/logrotate.d
  # echo -e "/var/log/cron\n/var/log/mail\n/var/log/messages {\n\trotate 4\n\tweekly\n\tmissingok\n\tnotifempty\n\tcompress\n\tsharedscripts\n\tpostrotate\n\t/etc/init.d/inetutils-syslogd reload >/dev/null\n\tendscript\n}" > /etc/logrotate.d/inetutils-syslogd

  service{'inetutils-syslogd':
    ensure    => running,
    enable    => true,
    hasstatus => true,
  }
}
