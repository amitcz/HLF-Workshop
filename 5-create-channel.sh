export DA_CHANNEL=dachannel
peer channel create -o orderer0.example.com:7050 -c $DA_CHANNEL -f ./network-config/dachannel.tx
peer channel join -b dachannel.block
