#!/usr/bin/env zsh

run() {
    echo "\e[0;36mrunning \e[1;37m\`$@'\e[0m"
    $@
    if [ $? -ne 0 ]; then
        echo "\e[1;31mAborting due to an error.\e[0m"
        exit
    fi
    echo
}

run sudo curl -so /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
run sudo apt update

echo -e "\e[0;32mインストールするバージョンを選択してください．\e[0m"
select ver in $(apt-cache madison kubeadm | head -n 4 | cut -d '|' -f 2 | xargs)
do
    break
done

echo -ne "\e[0;32mバージョン \033[1;33m${ver} \033[0;32mに更新しますか？\e[0m"
read -q "A? [y/N] "
echo
if [ $A != "y" ]; then 
    echo "Stop".
    exit
fi

echo -e "\e[0;32mバージョン \033[1;33m${ver} への更新を開始します．\e[0m"
for name in kubeadm kubelet kubectl;
do
    run sudo apt-mark unhold $name
    run sudo apt-get install --allow-downgrades -y $name=$ver
    run sudo apt-mark hold $name
 done
