#!/bin/sh

/usr/local/bin/nethermind/Nethermind.Runner -c bidao --datadir /var/lib/nethermind \
  --JsonRpc.EnginePort=8551 \
  --JsonRpc.EngineHost=0.0.0.0 \
  --JsonRpc.JwtSecretFile /keys/jwt/jwt.secret
