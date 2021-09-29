echo "***********************************************"
echo "*****  Chaincode install on daiict peers  *****"
echo "***********************************************"
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/daiict.example.com/users/Admin@daiict.example.com/msp
CORE_PEER_ADDRESS=peer0.daiict.example.com:7051
CORE_PEER_LOCALMSPID="DAIICTOrganizationMSP"
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/daiict.example.com/peers/peer0.daiict.example.com/tls/ca.crt
peer chaincode install -n balancetransfer -v 1.0 -p github.com/chaincode/balance-transfer

CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/daiict.example.com/users/Admin@daiict.example.com/msp
CORE_PEER_ADDRESS=peer1.daiict.example.com:7051
CORE_PEER_LOCALMSPID="DAIICTOrganizationMSP"
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/daiict.example.com/peers/peer1.daiict.example.com/tls/ca.crt
peer chaincode install -n balancetransfer -v 1.0 -p github.com/chaincode/balance-transfer
