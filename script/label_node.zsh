kubectl label node tanzania node-role.kubernetes.io/server=large --overwrite
kubectl label node tanzania node-role.kubernetes.io/storage=zfs --overwrite

kubectl label node jawa node-role.kubernetes.io/storage=zfs --overwrite

kubectl label node worker node-role.kubernetes.io/server=large --overwrite

kubectl label node rpi-cm4-sensor-1 node-role.kubernetes.io/sensor=room --overwrite
kubectl annotate nodes rpi-cm4-sensor-1 location=洋室A --overwrite

kubectl label node rpi-cm4-sensor-2 node-role.kubernetes.io/sensor=room --overwrite
kubectl annotate nodes rpi-cm4-sensor-2 location=洋室B --overwrite

kubectl label node rpi-cm4-sensor-3 node-role.kubernetes.io/sensor=room --overwrite
kubectl annotate nodes rpi-cm4-sensor-3 location=洋室C --overwrite

kubectl label node rpi-cm4-sensor-4 node-role.kubernetes.io/sensor=room --overwrite
kubectl annotate nodes rpi-cm4-sensor-4 location=家事室 --overwrite

kubectl label node hems node-role.kubernetes.io/server=hems --overwrite

kubectl label node rasp-meter-8 node-role.kubernetes.io/sensor=room --overwrite
kubectl annotate nodes rasp-meter-8 location=監視カメラボックス --overwrite

kubectl label node rasp-cooler node-role.kubernetes.io/hems=unit_cooler --overwrite
kubectl annotate nodes rasp-cooler location=室外機冷却 --overwrite
