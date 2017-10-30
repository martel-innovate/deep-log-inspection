#!/bin/sh
plugins/search-guard-5/tools/sgadmin.sh -cd config/ -ts config/truststore.jks -tspass $TS_PASS -ks config/sgadmin-keystore.jks -kspass $KS_PASS -nhnv -cn deeplog
