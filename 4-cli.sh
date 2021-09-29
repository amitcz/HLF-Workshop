# Entering into cli 
docker exec -it cli bash

export CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/daiict.example.com/users/Admin@daiict.example.com/msp
export CORE_PEER_ADDRESS=peer0.daiict.example.com:7051
export CORE_PEER_LOCALMSPID="DAIICTOrganizationMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/daiict.example.com/peers/peer0.daiict.example.com/tls/ca.crt
