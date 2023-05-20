# Dockerized staking for Bidao Smart Chain Devnet

## Disclaimer
There are many security concerns. If you are not sure what you are doing, please do not use this script. I am not responsible for any loss of funds.
This repository is for educational purposes only and is not intended to be used in production.
Use only with test accounts and testnet tokens. Do not use addresses with real funds.

## Requirements
- Docker

## Usage
1. Clone this repository
2. Copy .env.example to .env and fill in the values
```
NUMBER_OF_VALIDATORS=1
# your address for receiving rewards
EXECUTION_ADDRESS=""
KEYSTORE_PASSWORD=""
GRAFFITI=""
```
3. Run `docker-compose up -d`

After first run all secrets will be created automatically. You can find them in the `keys` folder.
Mnemonic phrase will be stored in `keys/validator/mnemonic.txt` file.
`deposit_data-*.json` will be stored in `keys/validator/` directory.

