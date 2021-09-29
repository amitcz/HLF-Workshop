echo "***********************************************"
echo "*****   Invoking the transfer function    *****"
echo "***********************************************"
peer chaincode invoke -n balancetransfer -c '{"Args":["invoke","a","b","10"]}' -C $DA_CHANNEL

echo "***********************************************"
echo "*****  Querying the query function for A  *****"
echo "***********************************************"
peer chaincode query -n balancetransfer -c '{"Args":["query","a"]}' -C $DA_CHANNEL
echo "***********************************************"
echo "*****  Querying the query function for B  *****"
echo "***********************************************"
peer chaincode query -n balancetransfer -c '{"Args":["query","b"]}' -C $DA_CHANNEL
