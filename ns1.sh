#!/bin/sh
# version 0.1 - 01/05/2021 - rboucher@ns1.com

#--- BEGIN Edit Configuration Items
TAG=3.2.3
POP_ID=lab
SERVER_ID=corenode
PROJECT=ddi
CONTAINERS='data core xfr'
DOCKER_COMPOSE=docker-compose.yml
#--- END Edit Configuration Items

export TAG POP_ID SERVER_ID

#--- Don't start without a docker-compose file...
if [ ! -f $DOCKER_COMPOSE ]; then
	echo "$DOCKER_COMPOSE does not exist! - Aborting..."
	exit 1
fi

case "$1" in
	start)
        docker-compose -p $PROJECT -f $DOCKER_COMPOSE up -d $CONTAINERS
		;;
	stop)
		docker-compose -p $PROJECT -f $DOCKER_COMPOSE stop $CONTAINERS
		;;
	status)
		docker-compose -p $PROJECT -f $DOCKER_COMPOSE ps
		;;
        delete)
		docker-compose -p $PROJECT -f $DOCKER_COMPOSE down -v $CONTAINERS
		;;    
	*)
		echo "Usage: $0 {start|stop|status|delete}"
		exit 1 
esac

exit 0
