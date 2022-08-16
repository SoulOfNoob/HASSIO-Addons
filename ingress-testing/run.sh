#!/usr/bin/with-contenv bashio

echo "Hello world!"

# python3 -m http.server 8000
python -m SimpleHTTPServer 7043
# twistd -no web --https=7043 --path .