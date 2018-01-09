Install and run xmr stak on azure batch

Install steps
===
* From Azure cloud shell (or a local shell with `az`) edit monpool.json to define cluster name & run `./mkpool.sh`
* The script deletes a pool named mon01 and creates it from monpool.json
