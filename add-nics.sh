for vm in $(govc ls vm | grep pool-1 | xargs -n1 basename)
do
       echo $vm
       govc vm.network.add -vm $vm -net "iSCSI1" -net.adapter e1000e
       govc device.info -vm $vm ethernet-*
done

echo "Run ansible-playbook"
ansible-playbook add-nics-ips.yaml
