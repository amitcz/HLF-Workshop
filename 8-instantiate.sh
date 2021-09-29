echo "***************************************************"
echo "*****  Chaincode instantiate on daiict peers  *****"
echo "***************************************************"

CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/daiict.example.com/users/Admin@daiict.example.com/msp
CORE_PEER_ADDRESS=peer0.daiict.example.com:7051
CORE_PEER_LOCALMSPID="DAIICTOrganizationMSP"
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/daiict.example.com/peers/peer0.daiict.example.com/tls/ca.crt
peer chaincode instantiate -o orderer0.example.com:7050 -C $DA_CHANNEL -n balancetransfer -v 1.0 -c '{"Args":["init","a","100","b","200"]}' -P "OR ('DAIICTOrganizationMSP.peer')"
