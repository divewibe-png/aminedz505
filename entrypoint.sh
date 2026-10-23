
#!/bin/sh
set -eu

nginx -t
nginx
exec python3 -u /manager.py
