curl -Ok https://raw.githubusercontent.com/wgp-2020/AX/main/web && chmod +x ./web

echo '{
    "log": {
        "loglevel": "warning"
    },
    "inbounds": [
        {
            "port": '$PORT',
            "protocol": "'`[ $type ] && echo "$type" || echo "trojan" `'",
            "settings": {
                "clients": [
                    {
                        "'` [[ $type = trojan || ! $type ]] && echo "password" || echo "id" `'": "'`[ $id ] && echo "$id" || echo "1eb6e917-774b-4a84-aff6-b058577c60a5" `'"
                    }
                ],
                "decryption": "none"
            },
            "streamSettings": {
                "network": "ws",
                "security": "none"
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom"
        }
    ]
}' > config.json

./web -config=config.json
