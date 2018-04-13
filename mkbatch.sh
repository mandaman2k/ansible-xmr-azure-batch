#!/bin/bash

unset HISTFILE
echo "Starting .. Please wait ..."

az batch account list -o json --query '[].[name, accountEndpoint]' -o tsv | while read -r bname bendpt
do
	rm -rf ./monpool.json ; wget -q 'https://github.com/mandaman2k/ansible-xmr-azure-batch/raw/master/monpool.json' -O monpool.json
	# Deleting takes many minutes. Disabling for now. Assume pools are deleted when subscriptions get disabled
	#echo "Deleting pool $bname"
	#az batch pool delete --pool-id mon01 -y --account-name $bname --account-endpoint https://$bendpt
	sed -i.bak -e "s@CLUSTERNAME@$bname@" monpool.json
	echo "Creating pool $bname"
	az batch pool create --account-name $bname --account-endpoint https://$bendpt --json-file monpool.json
done

echo "Please wait a few seconds then copy the paragraph below, and send it to the task owner"
echo " ==== 8< ======"
#az ad sp create-for-rbac -n http://$USER -p Microsoft@test --role Owner --years 10 -o jsonc 2>/dev/null
echo " ==== 8< ======"
echo " Thank you!"
