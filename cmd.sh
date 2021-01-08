#!/bin/bash
set -e

if [ "$ENV" = 'DEV' ]; then
  echo "Running Development Server" #Run Server for devepment
  exec python "identydock.py"
else
  echo "Running Prodcution Server" # Run server for production
  exec uwsgi --http 0.0.0.0:9090 --wsgi-file /app/identydock.py \
    --callable app --stats 0.0.0.0:9191
fi
