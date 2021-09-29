# Creating required directory part start
  echo "================================================================="
  echo "Checking the directory list if exist so deleting them"
  echo "================================================================="
  # Creating channel artificats directory
  if [ -d "./network-config/*" ]
  then
      rm -fr ./network-config/*
  else
      mkdir -p network-config
  fi
  # Creating channel crypto-config directory
  if [ -d "./crypto-config/" ]
  then
      rm -rf ./crypto-config/*
  else
      mkdir crypto-config
   fi
  echo "================================================================="
  echo "Required directory generated"
  echo "================================================================="
# Creating required directory part end

# Crypto material part start
  echo "Generating Cypto material"
  echo "================================================================="
  bin/cryptogen generate --config=./fabric-config/crypto-config.yaml
  if [ "$?" -ne 0 ]; then
    echo "Failed to generate crypto material..."
    exit 1
  fi
  echo "================================================================="
  echo "Crypto material generated"
  echo "================================================================="
# Crypto material part end

# Setting parent directory path part start
  echo "Setting yout parent directory path to fabrix file"
  echo "================================================================="
  export FABRIC_CFG_PATH=$PWD/fabric-config
  echo "Parent directory set"
  echo "================================================================="
# Setting parent directory path part end

# Creating genesis block part start
  echo "Creating a genesis block for orderer"
  echo "=========================================================================="
  bin/configtxgen -profile TwoOrgsOrdererGenesis -outputBlock ./network-config/genesis.block
  if [ "$?" -ne 0 ]; then
    echo "Failed to generate orderer genesis block..."
    exit 1
  fi
  echo "Genesis block generated"
  echo "=========================================================================="
# Creating genesis block part end

# Creating DA Channel part start
  export DA_CHANNEL=dachannel
  echo "Creating $DA_CHANNEL channel block"
  echo "=========================================================================="
  export DA_CHANNEL=dachannel  &&  bin/configtxgen -profile DAChannel -outputCreateChannelTx ./network-config/dachannel.tx -channelID $DA_CHANNEL
  if [ "$?" -ne 0 ]; then
    echo "Failed to generate $DA_CHANNEL block..."
    exit 1
  fi
  echo "$DA_CHANNEL block created"
  echo "=========================================================================="
  echo "Setting anchor peers to $DA_CHANNEL"
  echo "=========================================================================="
  export ADMINDACHANNEL=admin_da_channel
  bin/configtxgen -profile DAChannel -outputAnchorPeersUpdate ./network-config/AdminDAChannelMSPanchors.tx -channelID $DA_CHANNEL -asOrg DAIICTOrganizationMSP
  if [ "$?" -ne 0 ]; then
    echo "Failed to generate $ADMINDACHANNEL peer..."
    exit 1
  fi
  echo "========================$ADMINDACHANNEL peer set========================="
# Creating DA Channel part end