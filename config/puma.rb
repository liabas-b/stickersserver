rails_env = 'production'

threads 4,4

bind  "unix:///home/stickers/StickersServer/tmp/sockets/StickersServer.sock"
pidfile "/home/stickers/StickersServer/tmp/puma/pid"
state_path "/home/stickers/StickersServer/tmp/puma/state"

activate_control_app
