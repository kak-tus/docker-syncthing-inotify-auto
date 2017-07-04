max_stale = "2m"

template {
  source = "/home/user/config.xml.template"
  destination = "/home/user/.config/syncthing/config.xml"
}

exec {
  command = "/usr/local/bin/syncthing-inotify"
  splay = "60s"
  kill_timeout = "20s"
}
