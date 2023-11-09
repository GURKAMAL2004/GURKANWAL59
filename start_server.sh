
#!/bin/bash
# Start a local server in the background
python3 -m http.server > /dev/null 2>&1 &
SERVER_PID=$!
echo "Server started with PID: $SERVER_PID"

# Wait for a few seconds to give the server time to start
sleep 2

# Open the default web browser
if which xdg-open > /dev/null; then
   xdg-open http://localhost:8000
elif which gnome-open > /dev/null; then
   gnome-open http://localhost:8000
else
   echo "Could not detect the web browser to open the application."
fi

# Simple check to see if the server is still running, restart if not
if ! kill -0 "$SERVER_PID" > /dev/null 2>&1; then
    echo "Server stopped running. Starting again..."
    python3 -m http.server
else
    echo "Server is running."
fi
