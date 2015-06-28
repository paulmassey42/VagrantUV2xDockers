#!/bin/bash

${CATALINA_HOME}/bin/catalina.sh run &
sleep 20;
if [ ! -f /.dpus_installed ]; then
    sleep 10;
    /deployrun.sh;
    touch /.dpus_installed
fi
wait
