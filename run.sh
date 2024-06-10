#!/bin/sh

# Verificar se a variável de ambiente DEVICES está definida
if [ -z "$DEVICES" ]; then
  echo "Erro: a variável de ambiente DEVICES não está definida."
  exit 1
fi

# Fazer o attach de cada dispositivo configurado
for device in $(echo "${DEVICES}" | jq -c '.[]'); do
  name=$(echo $device | jq -r '.name')
  host=$(echo $device | jq -r '.host')
  bus_id=$(echo $device | jq -r '.bus_id')
  echo "Conectando ao dispositivo ${name} no host ${host} com bus_id ${bus_id}"
  usbip attach -r $host -b $bus_id
done

# Manter o script em execução
while true; do
  sleep 3600
done