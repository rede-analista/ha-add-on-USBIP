#!/bin/bash
CONFIG_PATH=/data/options.json

# Verifique se o arquivo de configuração existe
if [ ! -f "$CONFIG_PATH" ]; then
    echo "Arquivo de configuração não encontrado: $CONFIG_PATH"
    exit 1
fi

# Extrair o número de dispositivos
DEVICES=$(jq --raw-output '.devices | length' $CONFIG_PATH)

# Verifique se há dispositivos configurados
if [ "$DEVICES" -eq 0 ]; then
    echo "Nenhum dispositivo configurado."
    exit 1
fi

# Conectar os dispositivos configurados
for (( i=0; i<"$DEVICES"; i++ )); do
    NAME=$(jq --raw-output ".devices[$i].name" $CONFIG_PATH)
    HOST=$(jq --raw-output ".devices[$i].host" $CONFIG_PATH)
    BUS_ID=$(jq --raw-output ".devices[$i].bus_id" $CONFIG_PATH)

    echo "Connecting $NAME ($HOST:$BUS_ID)"
    usbip attach -r $HOST -b $BUS_ID

    if [ $? -ne 0 ]; then
        echo "Erro: Falha ao conectar $NAME ($HOST:$BUS_ID)"
    else
        echo "Sucesso: $NAME conectado."
    fi
done

# Manter o container rodando
tail -f /dev/null
