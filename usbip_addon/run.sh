#!/bin/bash

CONFIG_PATH=/data/options.json

DEVICES=$(jq --raw-output '.devices | length' $CONFIG_PATH)

# Verificar se a variável de ambiente DEVICES está definida
if [ -z "$DEVICES" ]; then
  echo "Erro: a variável de ambiente DEVICES não está definida."
  exit 1
fi

for (( i=0; i<"$DEVICES"; i++ ));
do
  NAME=$(jq --raw-output ".devices[$i].name" $CONFIG_PATH)
  HOST=$(jq --raw-output ".devices[$i].host" $CONFIG_PATH)
  BUS_ID=$(jq --raw-output ".devices[$i].bus_id" $CONFIG_PATH)

  echo "Connecting $NAME ($HOST:$BUS_ID)"
  usbip attach -r $HOST -b $BUS_ID
done

# Keep the container running
tail -f /dev/null