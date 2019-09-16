#!/usr/bin/env bash

source vendor/bo/t3toolbox/bin/lib.sh

syncdevfiles () {
    echo ${RED}
    echo "Get Fileadmin and Uploads from Develop"
    echo ${NC}

    if [ -d "public/fileadmin" ]
    then
        rsync -avz --exclude '**/_processed_' ${dev_user}@${dev_url}:${dev_path}/fileadmin/* public/fileadmin
    else
        echo "WARING!! - No Local Fileadmin folder found in public/fileadmin"
        echo
        exit
    fi

    if [ -d "public/uploads" ]
    then
        rsync -avz ${dev_user}@${dev_url}:${dev_path}/uploads/* public/uploads
    else
        echo "WARING!! -  No Local Uploads folder found in public/uploads"
        echo
        exit
    fi

    echo
    echo
}



if [ ${developcheck} = "passed" ]
then
    syncdevfiles
else
    echo ${RED}
    echo "ERROR - Please check local.json and secret.json"
    echo ${NC}
fi
