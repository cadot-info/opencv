docker run -d -p :80  \
--name formidriveapi \
--label traefik.frontend.rule=Host:formidriveapi.cadot.info,www.formidriveapi.cadot.info \
--label traefik.enable=true \
-v /home/docker/sites/formidriveapi:/var/www/html  \
cadotinfo/opencv
