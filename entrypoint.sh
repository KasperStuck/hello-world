#!/bin/sh
cat > /usr/share/nginx/html/index.html <<EOF
<!DOCTYPE html>
<html lang="da">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hello World</title>
</head>
<body>
    <h1>Hello World!</h1>
    <p>Server: $(hostname)</p>
    <p>IP: $(hostname -i | awk '{print $1}')</p>
</body>
</html>
EOF
exec nginx -g 'daemon off;'
