#!/usr/bin/expect

set timeout 60

set num_validators $env(NUMBER_OF_VALIDATORS)
set execution_address $env(EXECUTION_ADDRESS)
set keystore_password $env(KEYSTORE_PASSWORD)


spawn /deposit --language english new-mnemonic  --mnemonic_language english --num_validators $num_validators --chain bidao --execution_address $execution_address
expect -exact "Repeat your execution address for confirmation.:"
send "$execution_address\r"

expect "Create a password that secures your validator keystore(s). You will need to re-enter this to decrypt them when you setup your Ethereum validators.:"
send "$keystore_password\r\r"

expect -exact "Repeat your keystore password for confirmation:"
send "$keystore_password\r"

expect "This is your mnemonic (seed phrase). Write it down and store it safely. It is the ONLY way to retrieve your deposit."
expect -re "\r\n\r\n\r\n(.*)\r\n\r\n\r\n"
set mnemonic $expect_out(1,string)

expect "Press any key when you have written down your mnemonic."
send "\r"

expect "Please type your mnemonic (separated by spaces) to confirm you have written it down. Note: you only need to enter the first 4 letters of each word if you'd prefer."
send "$mnemonic\r"

expect "Press any key."
send "\r"

set outFileId [open /validator_keys/mnemonic "w"]
puts $outFileId $mnemonic
close $outFileId
expect eof
