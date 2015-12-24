#!/bin/bash

BIN=./bin
# SLEEP_INTERVAL_S=2

# # wait_for_startup friendly_name host port timeout_s
# wait_for_startup() {
#     local friendly_name="$1"
#     local host="$2"
#     local port="$3"
#     #local timeout_s="$4"

#     local now_s=`date '+%s'`
#     local stop_s=$(( $now_s + 60 ))
#     local status=

#     echo -n "Connecting to $friendly_name ($host:$port)"
#     while [ $now_s -le $stop_s ]; do
#         echo -n .
#         $BIN/checksocket.sh $host $port >/dev/null 2>&1
#         if [ $? -eq 0 ]; then
#             echo " OK (connected to $host:$port)."
#             return 0
#         fi
#         sleep $SLEEP_INTERVAL_S
#         now_s=`date '+%s'`
#     done

#     echo " timeout exceeded (60 seconds): could not connect to $host:$port" >&2
#     return 1
# }

# echo "starting cassandra"

# cassandra

# ps -aux
# echo "waiting"
# sleep 60s
# echo "done waiting"
# ps -aux

# # wait_for_startup Cassandra \
# # 	localhost \
# #     7199 \
# # 	60 || {
# # 	return 1
# # }

$BIN/gremlin-server.sh conf/gremlin-server/gremlin-server.yaml
