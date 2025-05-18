if [ "$FEAT_NOTIFICATIONS" = "true" ]; then
  doppler run -- docker-compose -f docker-compose.yml -f docker-compose.notifications.yml up --build -d
else
  doppler run -- docker-compose -f docker-compose.yml up --build -d
fi
