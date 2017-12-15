#!/bin/bash
# run this scripts before deploying the system
OPENSSL_VER="$(openssl version)"

if [[ $OPENSSL_VER == *"0.9"* ]]; then
	echo "Your OpenSSL version is too old: $OPENSSL_VER"
	echo "Please install version 1.0.1 or later"
	exit -1
else
    echo "Your OpenSSL version is: $OPENSSL_VER"
fi

set -e
./clean.sh
./gen_root_ca.sh $CA_PASS $TS_PASS
./gen_client_node_cert.sh logstash $KS_PASS $CA_PASS
./gen_client_node_cert.sh kibana $KS_PASS $CA_PASS
./gen_client_node_cert.sh sgadmin $KS_PASS $CA_PASS
rm -f ./*tmp*
