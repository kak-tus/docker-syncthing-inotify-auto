max_stale = "2m"

template {
  source = "/home/user/config.xml.template"
  destination = "/home/user/.config/syncthing/config.xml"
}

template {
  source = "/home/user/start.sh.template"
  destination = "/home/user/start.sh"
  perms = 0755
}

exec {
  command = "/home/user/start.sh"
  splay = "60s"
  kill_timeout = "20s"
}
