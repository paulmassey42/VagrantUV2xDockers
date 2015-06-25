#!/bin/bash

if [ ! -f /.dpus_installed ]; then
    /deploy-dpus.sh
    touch /.dpus_installed
fi

exec ${CATALINA_HOME}/bin/catalina.sh run
